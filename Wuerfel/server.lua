ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('cube', function(source)
    TriggerClientEvent('wuerfel:roll', source)
end)

RegisterServerEvent('wuerfel:show')
AddEventHandler('wuerfel:show', function(target)
    local xPlayer = ESX.GetPlayerFromId(source)
    local random = math.random(1, 6)

    TriggerClientEvent('wuerfel:showResult', source, xPlayer.name, random)

    if target ~= nil then
        TriggerClientEvent('wuerfel:showResult', target, xPlayer.name, random)
    end

end)