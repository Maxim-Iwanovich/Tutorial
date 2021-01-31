-- Scripting 1
RegisterCommand('tpw', function(source, args, raw)
    local playerPed = PlayerPedId() -- GetPlayerPed(-1)
    local waypoint = GetFirstBlipInfoId(8)
    local waypointCoords = GetBlipInfoIdCoord(waypoint)

    SetEntityCoords(playerPed, waypointCoords.x, waypointCoords.y, waypointCoords.z+35)

end)


-- Scripting 2
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(10000)
        print('do')
        TriggerEvent('skinchanger:getSkin', function(skinData)
            if skinData ~= nil then
                if skinData['beard_2'] > -1 and skinData['beard_2'] < 10 then
                    skinData['beard_2'] = skinData['beard_2'] + 1
                    TriggerEvent('skinchanger:loadSkin', skinData)
                    TriggerServerEvent('esx_skin:save', skinData)
                end
            end
        end)
    end
end)
