Bridge = {}
Bridge.Name = 'unknown'

local function detectFramework()
  if Config.Framework ~= 'auto' then return Config.Framework end
  if GetResourceState('qbx_core') == 'started' then return 'qbox' end
  if GetResourceState('qb-core') == 'started' then return 'qb' end
  return 'qb'
end

local FW = detectFramework()

CreateThread(function()
  Bridge.Name = FW
end)

function Bridge.GetPlayer(src)
  if FW == 'qbox' then
    return exports.qbx_core:GetPlayer(src)
  end

  local QBCore = exports['qb-core']:GetCoreObject()
  return QBCore.Functions.GetPlayer(src)
end

function Bridge.IsAdmin(src)
  -- Qbox / MRI usa ACE
  if IsPlayerAceAllowed(src, 'mvehicleshop.admin') then
    return true
  end

  return false
end


function Bridge.Notify(msg, nType)
  lib.notify({ title = 'mVehicleshop', description = msg, type = nType or 'inform' })
end

function Bridge.GiveKeys(src, plate)
  local mode = Config.Keys

  if mode == 'none' then return end

  if mode == 'auto' then
    if GetResourceState('qbx_vehiclekeys') == 'started' then mode = 'qbx_vehiclekeys'
    elseif GetResourceState('qb-vehiclekeys') == 'started' then mode = 'qb-vehiclekeys'
    else
      mode = 'none'
    end
  end

  if mode == 'qbx_vehiclekeys' then
    -- qbx_vehiclekeys
    exports.qbx_vehiclekeys:GiveKeys(src, plate)
    return
  end

  if mode == 'qb-vehiclekeys' then
    TriggerClientEvent('vehiclekeys:client:SetOwner', src, plate)
    return
  end
end

function Bridge.RemoveMoney(src, account, amount)
  local Player = Bridge.GetPlayer(src)
  if not Player then return false end

  if amount <= 0 then return true end

  -- qb/qbx compat
  if Player.Functions and Player.Functions.RemoveMoney then
    local ok = Player.Functions.RemoveMoney(account, amount, "mvehicleshop-purchase")
    return ok ~= false
  end

  return false
end

function Bridge.GetMoney(src, account)
  local Player = Bridge.GetPlayer(src)
  if not Player then return 0 end
  local pd = Player.PlayerData
  if not pd or not pd.money then return 0 end
  return pd.money[account] or 0
end

function Bridge.GetCitizenId(src)
  local Player = Bridge.GetPlayer(src)
  if not Player then return nil end
  return Player.PlayerData and Player.PlayerData.citizenid
end
