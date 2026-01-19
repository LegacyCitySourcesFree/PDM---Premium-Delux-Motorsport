local uiOpen = false
local currentShop = nil
local lastCatalog = {}

local function getTarget()
  if Config.Target ~= 'auto' then return Config.Target end
  if GetResourceState('ox_target') == 'started' then return 'ox_target' end
  if GetResourceState('qb-target') == 'started' then return 'qb-target' end
  return 'qb-target'
end

local function spawnPed(pedCfg)
  lib.requestModel(pedCfg.model)
  local ped = CreatePed(0, joaat(pedCfg.model), pedCfg.coords.x, pedCfg.coords.y, pedCfg.coords.z - 1.0, pedCfg.coords.w, false, true)
  SetEntityInvincible(ped, true)
  SetBlockingOfNonTemporaryEvents(ped, true)
  FreezeEntityPosition(ped, true)
  if pedCfg.scenario then
    TaskStartScenarioInPlace(ped, pedCfg.scenario, 0, true)
  end
  return ped
end

local function openMenu(shop)
  local options = {
    { title = 'Abrir loja', icon = 'car', onSelect = function()
        currentShop = shop.id
        SetNuiFocus(true, true)
        uiOpen = true
        SendNUIMessage({ action='open', shop = shop })
        -- carrega catalogo
        local catalog = lib.callback.await('mvehicleshop:cb:getCatalog', false, shop.id)
        lastCatalog = catalog or {}
        SendNUIMessage({ action='catalog', items = lastCatalog, categories = Config.Categories })
      end
    }
  }

  lib.registerContext({
    id = 'mvehicleshop_context_'..shop.id,
    title = shop.label,
    options = options
  })
  lib.showContext('mvehicleshop_context_'..shop.id)
end

local function setupShop(shop)
  local ped = spawnPed(shop.ped)

  local target = getTarget()
  if target == 'ox_target' then
    exports.ox_target:addLocalEntity(ped, {
      {
        name = 'mvehicleshop:'..shop.id,
        label = 'Falar com vendedor',
        icon = 'fa-solid fa-car',
        distance = Config.InteractDistance,
        onSelect = function()
          openMenu(shop)
        end
      }
    })
  else
    exports['qb-target']:AddTargetEntity(ped, {
      options = {
        {
          icon = "fas fa-car",
          label = "Falar com vendedor",
          action = function()
            openMenu(shop)
          end
        }
      },
      distance = Config.InteractDistance
    })
  end
end

CreateThread(function()
  for _, shop in ipairs(Config.Shops) do
    setupShop(shop)
  end
end)

RegisterNetEvent('mvehicleshop:client:refresh', function(shopId)
  if not uiOpen or currentShop ~= shopId then return end
  local catalog = lib.callback.await('mvehicleshop:cb:getCatalog', false, shopId)
  lastCatalog = catalog or {}
  SendNUIMessage({ action='catalog', items = lastCatalog, categories = Config.Categories })
end)

-- NUI callbacks
RegisterNUICallback('close', function(_, cb)
  SetNuiFocus(false, false)
  uiOpen = false
  cb(true)
end)

RegisterNUICallback('buy', function(data, cb)
  TriggerServerEvent('mvehicleshop:server:buy', data)
  cb(true)
end)

RegisterNUICallback('isAdmin', function(_, cb)
  local isAdmin = lib.callback.await('mvehicleshop:cb:isAdmin', false)
  cb(isAdmin)
end)

RegisterNUICallback('adminUpsert', function(payload, cb)
  TriggerServerEvent('mvehicleshop:admin:upsert', payload)
  cb(true)
end)

RegisterNUICallback('adminDelete', function(payload, cb)
  TriggerServerEvent('mvehicleshop:admin:delete', payload.id, payload.shop)
  cb(true)
end)

-- Entrega/spawn do veículo
RegisterNetEvent('mvehicleshop:client:deliverVehicle', function(data)
  local model = data.model
  local plate = data.plate
  local c = data.coords

  lib.requestModel(model)

  local veh = CreateVehicle(joaat(model), c.x, c.y, c.z, c.w, true, false)
  SetVehicleNumberPlateText(veh, plate)
  SetEntityAsMissionEntity(veh, true, true)
  SetVehicleOnGroundProperly(veh)
  SetVehRadioStation(veh, "OFF")

  -- warp no veículo
  local ped = PlayerPedId()
  TaskWarpPedIntoVehicle(ped, veh, -1)

  -- tenta dar chave
  TriggerServerEvent('mvehicleshop:server:givekeys', plate) -- fallback (se quiser)
  -- e também local via bridge (mais confiável no server, mas aqui mantemos simples)

  lib.notify({ type='success', description=('Comprado! Placa: %s'):format(plate) })
end)

-- (opcional) evento server-side para keys
RegisterNetEvent('mvehicleshop:server:givekeys', function(plate)
  -- placeholder (não usado no client)
end)
