local function ensurePlateUnique(plate)
  local rows = MySQL.query.await('SELECT plate FROM player_vehicles WHERE plate = ?', { plate })
  return rows and #rows == 0
end

local function genPlate()
  local chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
  local function rnd(n)
    local s = ""
    for i=1,n do
      local r = math.random(#chars)
      s = s .. chars:sub(r, r)
    end
    return s
  end

  for _=1,25 do
    local p = (rnd(3) .. " " .. rnd(3)):upper()
    if ensurePlateUnique(p) then return p end
  end
  return (rnd(3) .. " " .. rnd(3)):upper()
end

local function getShopById(id)
  for _, s in ipairs(Config.Shops) do
    if s.id == id then return s end
  end
  return nil
end

lib.callback.register('mvehicleshop:cb:getCatalog', function(src, shopId)
  local rows = MySQL.query.await('SELECT * FROM mvehicleshop_vehicles WHERE shop = ? ORDER BY category, price ASC', { shopId })
  return rows or {}
end)

lib.callback.register('mvehicleshop:cb:isAdmin', function(src)
  return Bridge.IsAdmin(src)
end)

-- Admin CRUD
RegisterNetEvent('mvehicleshop:admin:upsert', function(payload)
  local src = source
  if not Bridge.IsAdmin(src) then return end

  payload.shop = payload.shop or 'pdm'
  payload.category = payload.category or 'sports'
  payload.model = (payload.model or ''):lower()
  payload.label = payload.label or payload.model
  payload.price = tonumber(payload.price) or 0
  payload.stock = tonumber(payload.stock) or 0
  payload.image = payload.image or nil

  if payload.id then
    MySQL.update.await([[
      UPDATE mvehicleshop_vehicles
      SET shop=?, category=?, model=?, label=?, price=?, stock=?, image=?
      WHERE id=?
    ]], { payload.shop, payload.category, payload.model, payload.label, payload.price, payload.stock, payload.image, payload.id })
  else
    MySQL.insert.await([[
      INSERT INTO mvehicleshop_vehicles (shop, category, model, label, price, stock, image)
      VALUES (?, ?, ?, ?, ?, ?, ?)
    ]], { payload.shop, payload.category, payload.model, payload.label, payload.price, payload.stock, payload.image })
  end

  TriggerClientEvent('mvehicleshop:client:refresh', src, payload.shop)
end)

RegisterNetEvent('mvehicleshop:admin:delete', function(id, shopId)
  local src = source
  if not Bridge.IsAdmin(src) then return end
  MySQL.update.await('DELETE FROM mvehicleshop_vehicles WHERE id = ?', { id })
  TriggerClientEvent('mvehicleshop:client:refresh', src, shopId)
end)

-- Purchase
RegisterNetEvent('mvehicleshop:server:buy', function(data)
  local src = source
  local shopId = data.shop
  local vehicleId = tonumber(data.vehicleId)

  local shop = getShopById(shopId)
  if not shop then return end

  local row = MySQL.single.await('SELECT * FROM mvehicleshop_vehicles WHERE id = ? AND shop = ?', { vehicleId, shopId })
  if not row then
    TriggerClientEvent('ox_lib:notify', src, { type='error', description='Veículo não encontrado.' })
    return
  end

  if row.stock <= 0 then
    TriggerClientEvent('ox_lib:notify', src, { type='error', description='Sem estoque.' })
    return
  end

  local money = Bridge.GetMoney(src, Config.PayAccount)
  if money < row.price then
    TriggerClientEvent('ox_lib:notify', src, { type='error', description='Dinheiro insuficiente.' })
    return
  end

  local ok = Bridge.RemoveMoney(src, Config.PayAccount, row.price)
  if not ok then
    TriggerClientEvent('ox_lib:notify', src, { type='error', description='Falha ao cobrar.' })
    return
  end

  local citizenid = Bridge.GetCitizenId(src)
  if not citizenid then return end

  local plate = genPlate()
  local model = row.model
  local hash = joaat(model)

  -- reduzir estoque
  MySQL.update.await('UPDATE mvehicleshop_vehicles SET stock = stock - 1 WHERE id = ?', { vehicleId })

  -- registrar como veículo do player (schema qb padrão)
  MySQL.insert.await([[
    INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, state, garage, fuel, engine, body)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
  ]], {
    GetPlayerIdentifierByType(src, 'license') or '',
    citizenid,
    model,
    hash,
    json.encode({}),
    plate,
    0,
    'pillboxgarage',
    100,
    1000,
    1000
  })

  TriggerClientEvent('mvehicleshop:client:deliverVehicle', src, {
    model = model,
    plate = plate,
    coords = shop.spawn.coords
  })
end)
