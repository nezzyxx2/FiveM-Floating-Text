Config = {}
Config.OldESX = false  -- Old ESX = True New ESX = falsse

ESX = nil
if Config.OldESX then
  Citizen.CreateThread(function()
    while ESX == nil do
      TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
      Citizen.Wait(0)
    end
  end)
else
  Citizen.CreateThread(function()
    while ESX == nil do
      ESX = exports['core']:getSharedObject() -- Change to your core name
      Citizen.Wait(0)
    end
  end)
end

local floatingTextConfig = {
  { text = "~r~[E] ~s~ - Owner Panel", coords = vector3(-931.395142, -1179.802979, 5.015614), job = "cookies" }, -- nil for no job & for everyone to use it.
  { text = "~r~[E] ~s~ - Farming", coords = vector3(-926.561401, -1173.256714, -0.902663), job = "cookies" },
}

Floating = Floating or {}
Floating.Functions = Floating.Functions or {}

-- Function from zlegacy base
Floating.Functions.FloatText = function(coords, text)
  AddTextEntry(GetCurrentResourceName(), text)
  BeginTextCommandDisplayHelp(GetCurrentResourceName())
  EndTextCommandDisplayHelp(2, false, false, -1)
  SetFloatingHelpTextWorldPosition(1, coords.x, coords.y, coords.z)
  SetFloatingHelpTextStyle(1, 1, 2, -1, 3, 0)
end

Citizen.CreateThread(function()
  while true do
    if ESX and ESX.PlayerData then
      local playerJob = ESX.PlayerData.job and ESX.PlayerData.job.name or nil
      local playerCoords = GetEntityCoords(PlayerPedId())
      local nearAny = false

      for _, entry in ipairs(floatingTextConfig) do
        if (not entry.job or (entry.job and playerJob == entry.job)) then
          local distance = #(playerCoords - entry.coords)
          if distance <= 2.3 then -- How close the player has to be for it to draw (Reccomended 1-3)
            nearAny = true
            Floating.Functions.FloatText(entry.coords, entry.text)
          end
        end
      end

      if nearAny then
        Citizen.Wait(0)
      else
        Citizen.Wait(500)
      end
    else
      Citizen.Wait(1000)
    end
  end
end)
