local QBCore = exports['qb-core']:GetCoreObject()
local NotifyType = Config.CoreSettings.Notify.Type
local InvType = Config.CoreSettings.Inventory.Type


--eat easter egg
QBCore.Functions.CreateUseableItem('easteregg', function(source, item)
    TriggerClientEvent('lusty94_egghunt:client:EatEasterEgg', source)
end)
--eat golden easter egg
QBCore.Functions.CreateUseableItem('goldeneasteregg', function(source, item)
    TriggerClientEvent('lusty94_egghunt:client:EatGoldenEasterEgg', source)
end)

--easter eggs callback
QBCore.Functions.CreateCallback('lusty94_egghunt:get:EasterEgg', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local required = Player.Functions.GetItemByName('easteregg')
    if required then
        cb(true)
    else
        cb(false)
    end
end)
--golden easter eggs callback
QBCore.Functions.CreateCallback('lusty94_egghunt:get:GoldenEasterEgg', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local required = Player.Functions.GetItemByName('goldeneasteregg')
    if required then
        cb(true)
    else
        cb(false)
    end
end)

--collect eggs
RegisterServerEvent('lusty94_egghunt:server:CollectEgg', function(args)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    local args = tonumber(args)
    local amount = 1
    if not Player then return end
    if args == 1 then
        if InvType == 'qb' then
            Player.Functions.AddItem("easteregg", amount)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["easteregg"], "add")
        elseif InvType == 'ox' then
            if exports.ox_inventory:CanCarryItem(src, 'easteregg', amount) then
                exports.ox_inventory:AddItem(src,"easteregg", amount)
            else
                TriggerClientEvent('lusty94_egghunt:client:cantCarry', src)
            end
        end
    elseif args == 2 then
        if InvType == 'qb' then
            Player.Functions.AddItem("goldeneasteregg", amount)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["goldeneasteregg"], "add")
        elseif InvType == 'ox' then
            if exports.ox_inventory:CanCarryItem(src, 'goldeneasteregg', amount) then
                exports.ox_inventory:AddItem(src,"goldeneasteregg", amount)
            else
                TriggerClientEvent('lusty94_egghunt:client:cantCarry', src)
            end
        end
    end
end)



--remove easter egg
RegisterServerEvent('lusty94_egghunt:server:EatEasterEgg', function(args)
	local src = source
	local Player = QBCore.Functions.GetPlayer(src)
    local args = tonumber(args)
    if not Player then return end
    if args == 1 then
        if InvType == 'qb' then
            Player.Functions.RemoveItem("easteregg", 1)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["easteregg"], "remove")
        elseif InvType == 'ox' then
                exports.ox_inventory:RemoveItem(src,"easteregg", 1)
        end
    elseif args == 2 then
        if InvType == 'qb' then
            Player.Functions.RemoveItem("goldeneasteregg", 1)
            TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["goldeneasteregg"], "remove")
        elseif InvType == 'ox' then
                exports.ox_inventory:RemoveItem(src,"goldeneasteregg", 1)
        end
    end
end)





local function CheckVersion()
	PerformHttpRequest('https://raw.githubusercontent.com/Lusty94/UpdatedVersions/main/EggHunt/version.txt', function(err, newestVersion, headers)
		local currentVersion = GetResourceMetadata(GetCurrentResourceName(), 'version')
		if not newestVersion then print("Currently unable to run a version check.") return end
		local advice = "^1You are currently running an outdated version^7, ^1please update^7"
		if newestVersion:gsub("%s+", "") == currentVersion:gsub("%s+", "") then advice = '^6You are running the latest version.^7'
		else print("^3Version Check^7: ^2Current^7: "..currentVersion.." ^2Latest^7: "..newestVersion..advice) end
	end)
end
CheckVersion()