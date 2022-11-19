local QBCore = exports['qb-core']:GetCoreObject()

-- Events

RegisterNetEvent('qb-personalcard:server:requestId', function(item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if not Player then return end
    if not Player.Functions.RemoveMoney("cash", item.cost) then return TriggerClientEvent('QBCore:Notify', src, ('You don\'t have enough money on you, you need %s cash'):format(item.cost), 'error') end
    local info = {}
    if item.item == "id_card" then
        info.citizenid = Player.PlayerData.citizenid
        info.firstname = Player.PlayerData.charinfo.firstname
        info.lastname = Player.PlayerData.charinfo.lastname
        info.birthdate = Player.PlayerData.charinfo.birthdate
        info.gender = Player.PlayerData.charinfo.gender
        info.nationality = Player.PlayerData.charinfo.nationality
    elseif item.item == "driver_license" then
        info.firstname = Player.PlayerData.charinfo.firstname
        info.lastname = Player.PlayerData.charinfo.lastname
        info.birthdate = Player.PlayerData.charinfo.birthdate
        info.type = "Class C Driver License"
    elseif item.item == "weaponlicense" then
        info.firstname = Player.PlayerData.charinfo.firstname
        info.lastname = Player.PlayerData.charinfo.lastname
        info.birthdate = Player.PlayerData.charinfo.birthdate
    else
        DropPlayer(source, "Attempted exploit abuse")
    end
    if not Player.Functions.AddItem(item.item, 1, nil, info) then return end
    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items[item.item], 'add')
end)