Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('wuerfel:roll')
AddEventHandler('wuerfel:roll', function()

	local player, distance = ESX.Game.GetClosestPlayer()

	if distance ~= -1 and distance <= 3.0 then
		-- es sind spieler da
		TriggerServerEvent('wuerfel:show', GetPlayerServerId(player))
	else
		-- es ist kein spieler da
		TriggerServerEvent('wuerfel:show', nil)
	end

end)

RegisterNetEvent('wuerfel:showResult')
AddEventHandler('wuerfel:showResult', function(sourcePlayer, randomint)

	ShowNotification('~p~' .. sourcePlayer .. ' hat einen Würfel geworfen')
	Citizen.Wait(3000)
	if randomint == 1 then
		ShowNotification('Der Würfel zeigt ' .. randomint .. ' Auge')
	else
		ShowNotification('Der Würfel zeigt ' .. randomint .. ' Augen')
	end
	

end)

function ShowNotification(text)
	SetNotificationTextEntry('STRING')
    AddTextComponentString(text)
	DrawNotification(false, true)
end