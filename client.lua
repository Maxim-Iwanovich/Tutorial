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

-- Scripting 3
Citizen.CreateThread(function()
    while true do

        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local distance = Vdist(playerCoords, Config.Destination.x, Config.Destination.y, Config.Destination.z)

        if IsControlJustReleased(0, 38) then
            if distance < 3.0 then
                ShowNotification('ja')
            else
                ShowNotification('nein')
            end
        end

        Citizen.Wait(1)

    end
end)

function ShowNotification(text)
	SetNotificationTextEntry('STRING')
    AddTextComponentString(text)
	DrawNotification(false, true)
end
