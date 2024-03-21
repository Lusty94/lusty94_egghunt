local QBCore = exports['qb-core']:GetCoreObject()
local NotifyType = Config.CoreSettings.Notify.Type
local TargetType = Config.CoreSettings.Target.Type
local ClothingType = Config.CoreSettings.Clothing.Type
local InvType = Config.CoreSettings.Inventory.Type
local MiniGameType = Config.MiniGameSettings.Type
local StressEvent = Config.CoreSettings.EventNames.Stress
local StressAmount = Config.CoreSettings.EventNames.StressRemovalAmount
local spawnedEggs = {}
local spawnedRabbits = {}
local busy = false
local playerPed = PlayerPedId()
local eggChance = Config.CoreSettings.Chances.FindEasterEgg
local goldenEggChance = Config.CoreSettings.Chances.FindGoldenEasterEgg
local buffsChance = Config.CoreSettings.Chances.Effects


------------------------< NOTIFICATIONS >-----------------------------

--collect easter eggs
function eggCollectedNotify(args)
    local args = tonumber(args)
    local header = 'Success!'
    local type = 'success'
    local length = Config.CoreSettings.Notify.Length.Success
    if args == 1 then
        message = 'You Collected An Easter Egg'
    elseif args == 2 then
        message = 'You Collected A Golden Easter Egg'
    end
    if NotifyType == 'qb' then
        QBCore.Functions.Notify(message, type, length)
    elseif NotifyType == 'okok' then
        exports['okokNotify']:Alert(header, message, length, type, Config.CoreSettings.Notify.Sound) 
    elseif NotifyType == 'mythic' then
        exports['mythic_notify']:DoHudText(type, message)
    elseif NotifyType == 'boii' then
        exports['boii_ui']:notify(header, message, type, length)
    elseif NotifyType == 'ox' then
        lib.notify({ title = header, description = message, type = type, duration = length})
    end
end

--busy
local function busyNotify()
    local message = 'You Are Already Doing Something.'
    local header = 'Error!'
    local type = 'error'
    local length = Config.CoreSettings.Notify.Length.Error
    if NotifyType == 'qb' then
        QBCore.Functions.Notify(message, type, length)
    elseif NotifyType == 'okok' then
        exports['okokNotify']:Alert(header, message, length, type, Config.CoreSettings.Notify.Sound) 
    elseif NotifyType == 'mythic' then
        exports['mythic_notify']:DoHudText(type, message)
    elseif NotifyType == 'boii' then
        exports['boii_ui']:notify(header, message, type, length)
    elseif NotifyType == 'ox' then
        lib.notify({ title = header, description = message, type = type, duration = length})
    end
end

--cancelled action
local function cancelNotify()
    local message = 'Action Cancelled.'
    local header = 'Error!'
    local type = 'error'
    local length = Config.CoreSettings.Notify.Length.Error
    if NotifyType == 'qb' then
        QBCore.Functions.Notify(message, type, length)
    elseif NotifyType == 'okok' then
        exports['okokNotify']:Alert(header, message, length, type, Config.CoreSettings.Notify.Sound) 
    elseif NotifyType == 'mythic' then
        exports['mythic_notify']:DoHudText(type, message)
    elseif NotifyType == 'boii' then
        exports['boii_ui']:notify(header, message, type, length)
    elseif NotifyType == 'ox' then
        lib.notify({ title = header, description = message, type = type, duration = length})
    end
end

--missing items
local function missingItemsNotify()
    local message = 'How Can You Eat Easter Eggs That You Don\'t Have?'
    local header = 'Error!'
    local type = 'error'
    local length = Config.CoreSettings.Notify.Length.Error
    if NotifyType == 'qb' then
        QBCore.Functions.Notify(message, type, length)
    elseif NotifyType == 'okok' then
        exports['okokNotify']:Alert(header, message, length, type, Config.CoreSettings.Notify.Sound) 
    elseif NotifyType == 'mythic' then
        exports['mythic_notify']:DoHudText(type, message)
    elseif NotifyType == 'boii' then
        exports['boii_ui']:notify(header, message, type, length)
    elseif NotifyType == 'ox' then
        lib.notify({ title = header, description = message, type = type, duration = length})
    end
end

--no egg found
function noEggFoundNotify(args)
    local args = tonumber(args)
    local header = 'Error!'
    local type = 'error'
    local length = Config.CoreSettings.Notify.Length.Error
    if args == 1 then
        message = 'You Dropped The Easter Egg And It Smashed!'
    elseif args == 2 then
        message = 'You Dropped The Golden Easter Egg And It Smashed!'
    end
    if NotifyType == 'qb' then
        QBCore.Functions.Notify(message, type, length)
    elseif NotifyType == 'okok' then
        exports['okokNotify']:Alert(header, message, length, type, Config.CoreSettings.Notify.Sound) 
    elseif NotifyType == 'mythic' then
        exports['mythic_notify']:DoHudText(type, message)
    elseif NotifyType == 'boii' then
        exports['boii_ui']:notify(header, message, type, length)
    elseif NotifyType == 'ox' then
        lib.notify({ title = header, description = message, type = type, duration = length})
    end
end

--no effects
function noEffectsNotify()
    local message = 'This Easter Egg Tasted Funny - You Got No Benefits From Eating It'
    local header = 'Error!'
    local type = 'error'
    local length = Config.CoreSettings.Notify.Length.Error
    if NotifyType == 'qb' then
        QBCore.Functions.Notify(message, type, length)
    elseif NotifyType == 'okok' then
        exports['okokNotify']:Alert(header, message, length, type, Config.CoreSettings.Notify.Sound) 
    elseif NotifyType == 'mythic' then
        exports['mythic_notify']:DoHudText(type, message)
    elseif NotifyType == 'boii' then
        exports['boii_ui']:notify(header, message, type, length)
    elseif NotifyType == 'ox' then
        lib.notify({ title = header, description = message, type = type, duration = length})
    end
end

--cant carry item
RegisterNetEvent('lusty94_egghunt:client:cantCarry', function()
    local message = 'You Cant Carry Anymore of This Item.'
    local header = 'Error!'
    local type = 'error'
    local length = Config.CoreSettings.Notify.Length.Error
    if NotifyType == 'qb' then
        QBCore.Functions.Notify(message, type, length)
    elseif NotifyType == 'okok' then
        exports['okokNotify']:Alert(header, message, length, type, Config.CoreSettings.Notify.Sound) 
    elseif NotifyType == 'mythic' then
        exports['mythic_notify']:DoHudText(type, message)
    elseif NotifyType == 'boii' then
        exports['boii_ui']:notify(header, message, type, length)
    elseif NotifyType == 'ox' then
        lib.notify({ title = header, description = message, type = type, duration = length})
    end
end)

--------------------------------< NORMAL EASTER EGGS >------------------------------

--spawn easter eggs
CreateThread(function()
    for k, v in pairs(Config.Eggs) do
        RequestModel(v.model)
        while not HasModelLoaded(v.model) do
            Wait(100)
        end
        Eggs = CreateObject(v.model, v.coords.x, v.coords.y, v.coords.z -1 , false, true, false)
        FreezeEntityPosition(Eggs, true)
        spawnedEggs[#spawnedEggs+1] = Eggs
        if TargetType == 'qb' then
            exports['qb-target']:AddTargetEntity(Eggs, {  options = { { item = v.item, name = 'Eggs', icon = v.icon, label = v.label, event = 'lusty94_egghunt:client:CollectEasterEgg' } }, distance = v.distance, })
        elseif TargetType == 'ox' then
            exports.ox_target:addLocalEntity(Eggs, { { items = v.item, name = 'Eggs', icon = v.icon, label = v.label, event = 'lusty94_egghunt:client:CollectEasterEgg', distance = v.distance} })
        end
        SetModelAsNoLongerNeeded(Eggs)
        if v.useblip then
            eggblip = AddBlipForCoord(v.coords)
            SetBlipSprite(eggblip, 489) -- change blip sprite here
            SetBlipDisplay(eggblip, 4)
            SetBlipScale(eggblip, 0.8)
            SetBlipColour(eggblip, 5) -- change blip colour here
            SetBlipAsShortRange(eggblip, true)
            BeginTextCommandSetBlipName('STRING')
            AddTextComponentString('Easter Egg') -- change easter eggs blip name here
            EndTextCommandSetBlipName(eggblip)
        end
    end
end)



--collect easter eggs
RegisterNetEvent("lusty94_egghunt:client:CollectEasterEgg", function(args)
    local playerPed = PlayerPedId()
    local pedcoords = GetEntityCoords(playerPed)
    local args = tonumber(args)
	local nearbyObject, nearbyID
	for i=1, #spawnedEggs, 1 do
		if #(pedcoords - GetEntityCoords(spawnedEggs[i])) < 5 then
			nearbyObject, nearbyID = spawnedEggs[i], i
		end
	end
	if nearbyObject and IsPedOnFoot(playerPed) then
        if not busy then
            busy = true
            LockInventory(true)
            collectEasterEggsAnim()
            if MiniGameType == 'progbar' then
                QBCore.Functions.Progressbar("collectEggs", "Collecting Easter Egg", Config.MiniGameSettings.ProgressBar.Times.CollectEasterEggs, false, true, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {}, {}, {}, function()
                    busy = false
                    LockInventory(false)
                    DeleteEntity(basket)
                    ClearPedTasks(playerPed)
                    SetEntityAsMissionEntity(nearbyObject, false, true)
                    DeleteObject(nearbyObject)
                    spawnedEggs[nearbyID] = nil
                    if math.random(1,100) <= eggChance then
                        TriggerServerEvent('lusty94_egghunt:server:CollectEgg', 1)
                        eggCollectedNotify(1)
                    else
                        noEggFoundNotify(1)
                    end
                end, function()
                    busy = false
                    LockInventory(false)
                    DeleteEntity(basket)
                    ClearPedTasks(playerPed)
                    cancelNotify()
                end)
            elseif MiniGameType == 'skill' then
                local success = lib.skillCheck({Config.MiniGameSettings.SkillCheckSettings.Difficulty, Config.MiniGameSettings.SkillCheckSettings.Difficulty, {areaSize = Config.MiniGameSettings.SkillCheckSettings.AreaSize, speedMultiplier = Config.MiniGameSettings.SkillCheckSettings.SpeedMultiplier}, Config.MiniGameSettings.SkillCheckSettings.Difficulty}, Config.MiniGameSettings.SkillCheckSettings.Keys)
                if success then
                    busy = false
                    LockInventory(false)
                    DeleteEntity(basket)
                    ClearPedTasks(playerPed)
                    SetEntityAsMissionEntity(nearbyObject, false, true)
                    DeleteObject(nearbyObject)
                    spawnedEggs[nearbyID] = nil
                    if math.random(1,100) <= eggChance then
                        TriggerServerEvent('lusty94_egghunt:server:CollectEgg', 1)
                        eggCollectedNotify(1)
                    else
                        noEggFoundNotify(1)
                    end
                else
                    busy = false
                    LockInventory(false)
                    DeleteEntity(basket)
                    ClearPedTasks(playerPed)
                    cancelNotify()
                end
            end
        else
            busyNotify()
        end
	end
end)


--eat easter egg and get buffs
RegisterNetEvent("lusty94_egghunt:client:EatEasterEgg", function(args)
    local args = tonumber(args)
    QBCore.Functions.TriggerCallback('lusty94_egghunt:get:EasterEgg', function(HasItems)  
        if HasItems then
            eatAnimation()
            QBCore.Functions.Progressbar("EatEasterEgg", "Eating Easter Egg", Config.MiniGameSettings.ProgressBar.Times.EatEasterEggs, false, true, {
                disableMovement = false,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = false,
            }, {
            }, {}, {}, function()
                ClearPedTasks(playerPed)
                DeleteEntity(prop)                        
                TriggerServerEvent('lusty94_egghunt:server:EatEasterEgg', 1)
                if math.random(1,100) <= buffsChance then
                    TriggerServerEvent(StressEvent, math.random(10,20)) -- change stress relief amount here
                    TriggerServerEvent("consumables:server:addHunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + math.random(20,40)) -- change amount of hunger is replenished here and change event name if using different consumables script

                    --[[ uncomment the events below for health and armour increase if you want them to be an effect of eating the easter eggs ]]

                    --SetEntityHealth(playerPed, GetEntityHealth(playerPed) + math.random(10,20)) -- change health increase amount here
                    --AddArmourToPed(playerPed, math.random(10,20)) -- change amrour increase amount here
                else
                    noEffectsNotify()
                end
            end, function()
                ClearPedTasks(playerPed)
                cancelNotify()
                DeleteEntity(prop)
            end)
        else
            missingItemsNotify()
        end
    end)
end)




--------------------------------< GOLDEN EASTER EGGS >------------------------------
local rabbitModel = 'a_c_rabbit_01' -- ped model for the rabbit

--spawn easter bunny to get golden eggs
CreateThread(function()
    RequestModel(rabbitModel)
    while not HasModelLoaded(rabbitModel) do
        Wait(1000)
    end
    spawnlocation = vector4(-356.91, -985.76, 29.74, 183.39) -- change spawn location for rabbit here
    Rabbits = CreatePed(0, rabbitModel, spawnlocation.x, spawnlocation.y, spawnlocation.z-1, spawnlocation.w, true, false)
    if TargetType == 'qb' then
        exports['qb-target']:AddTargetEntity(Rabbits, {  options = { { name = 'Rabbits', icon = 'fa-solid fa-egg', label = 'Collect Golden Easter Egg', event = 'lusty94_egghunt:client:GoldenEasterEgg' } }, distance = 2.0, })
    elseif TargetType == 'ox' then
        exports.ox_target:addLocalEntity(Rabbits, { { name = 'Rabbits', icon = 'fa-solid fa-egg', label = 'Collect Golden Easter Egg', event = 'lusty94_egghunt:client:GoldenEasterEgg', distance = 2.0} })
    end
    spawnedRabbits[#spawnedRabbits+1] = Rabbits
    RequestAnimDict('xm3_drg1_bmx_int-45')
    while not HasAnimDictLoaded('xm3_drg1_bmx_int-45') do
        Wait(0)
    end
    TaskPlayAnim(Rabbits, 'xm3_drg1_bmx_int-45', 'a_c_rabbit_01-45', 1.0, -1.0, 1.0, 11, 49, 0, 0, 0)
    TaskWanderInArea(Rabbits, spawnlocation.x, spawnlocation.y, spawnlocation.z, 5.0, 1000, 1000) -- the first number (5.0) is the radius the rabbit roams freely in edit this if you want a larger radius remove this if you want the rabbit to wander around
    SetModelAsNoLongerNeeded(Rabbits)
    useBlip = true -- toggle blip for rabbit on or off - if turning off then you must inform your players of a rough location otherwise they will struggle to find the rabbit to interact with
    if useBlip then
        rabbitBlip = AddBlipForCoord(spawnlocation.x, spawnlocation.y, spawnlocation.z)
        SetBlipSprite(rabbitBlip, 106) -- change blip sprite here
        SetBlipDisplay(rabbitBlip, 4)
        SetBlipScale(rabbitBlip, 0.6)
        SetBlipColour(rabbitBlip, 5) -- change blip colour here
        SetBlipAsShortRange(rabbitBlip, true)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString('Easter Bunny') -- change easter bunny blip name here
        EndTextCommandSetBlipName(rabbitBlip)
    end
end)


--collect golden easter egg
RegisterNetEvent("lusty94_egghunt:client:GoldenEasterEgg", function(args)
    local playerPed = PlayerPedId()
    local pedcoords = GetEntityCoords(playerPed)
    local args = tonumber(args)
	local nearbyRabbit, rabbitID
	for i=1, #spawnedRabbits, 1 do
		if #(pedcoords - GetEntityCoords(spawnedRabbits[i])) < 5 then
			nearbyRabbit, rabbitID = spawnedRabbits[i], i
		end
	end
	if nearbyRabbit and IsPedOnFoot(playerPed) then
        if not busy then
            RemoveBlip(rabbitBlip)
            ClearPedTasks(Rabbits)
            FreezeEntityPosition(Rabbits, true)
            busy = true
            LockInventory(true)
            collectEasterEggsAnim()
            if MiniGameType == 'progbar' then
                QBCore.Functions.Progressbar("collectGoldenEgg", "Collecting Golden Easter Egg", Config.MiniGameSettings.ProgressBar.Times.CollectEasterEggs, false, true, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {}, {}, {}, function()
                    busy = false
                    LockInventory(false)
                    ClearPedTasks(playerPed)
                    DeleteEntity(basket)
                    SetEntityAsMissionEntity(nearbyRabbit, false, true)
                    DeletePed(nearbyRabbit)
                    spawnedRabbits[rabbitID] = nil
                    if math.random(1,100) <= goldenEggChance then
                        TriggerServerEvent('lusty94_egghunt:server:CollectEgg', 2)
                        eggCollectedNotify(2)
                    else
                        noEggFoundNotify(2)
                    end
                end, function()
                    busy = false
                    LockInventory(false)
                    ClearPedTasks(playerPed)
                    cancelNotify()
                end)
            elseif MiniGameType == 'skill' then
                local success = lib.skillCheck({Config.MiniGameSettings.SkillCheckSettings.Difficulty, Config.MiniGameSettings.SkillCheckSettings.Difficulty, {areaSize = Config.MiniGameSettings.SkillCheckSettings.AreaSize, speedMultiplier = Config.MiniGameSettings.SkillCheckSettings.SpeedMultiplier}, Config.MiniGameSettings.SkillCheckSettings.Difficulty}, Config.MiniGameSettings.SkillCheckSettings.Keys)
                if success then
                    busy = false
                    LockInventory(false)
                    ClearPedTasks(playerPed)
                    DeleteEntity(basket)
                    SetEntityAsMissionEntity(nearbyRabbit, false, true)
                    DeletePed(nearbyRabbit)
                    spawnedRabbits[rabbitID] = nil
                    if math.random(1,100) <= goldenEggChance then
                        TriggerServerEvent('lusty94_egghunt:server:CollectEgg', 2)
                        eggCollectedNotify(2)
                    else
                        noEggFoundNotify(2)
                    end
                else
                    busy = false
                    LockInventory(false)
                    ClearPedTasks(playerPed)
                    cancelNotify()
                end
            end
        else
            busyNotify()
        end
	end
end)


--eat golden easter egg and transform into rabbit for 30 seconds
RegisterNetEvent("lusty94_egghunt:client:EatGoldenEasterEgg", function(args)
    local args = tonumber(args)
    QBCore.Functions.TriggerCallback('lusty94_egghunt:get:GoldenEasterEgg', function(HasItems)  
        if HasItems then
            LockInventory(true)
            eatAnimation()
            QBCore.Functions.Progressbar("EatGoldenEasterEgg", "Eating Golden Easter Egg", Config.MiniGameSettings.ProgressBar.Times.CollectEasterEggs, false, true, {
                disableMovement = false,
                disableCarMovement = false,
                disableMouse = false,
                disableCombat = false,
            }, {
            }, {}, {}, function()
                ClearPedTasks(playerPed)                      
                TriggerServerEvent('lusty94_egghunt:server:EatEasterEgg', 2)
                TriggerServerEvent(StressEvent, math.random(10,20)) -- change stress relief amount here
                TriggerServerEvent("consumables:server:addHunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + math.random(20,40)) -- change amount of hunger is replenished here and change event name if using different consumables script
                LockInventory(false)
                transformToRabbit()
            end, function()
                LockInventory(false)
                ClearPedTasks(playerPed)
                cancelNotify()
                DeleteEntity(prop)
            end)
        else
            missingItemsNotify()
        end
    end)
end)



local originalPedModel = nil

--save original ped model
function SaveOriginalPedModel()
    originalPedModel = GetEntityModel(PlayerPedId())
end

--revert back to original ped model
function RevertToOriginalModel()
    if originalPedModel then
        RequestModel(originalPedModel)
        while not HasModelLoaded(originalPedModel) do
            Wait(0)
        end
		if ClothingType == "qb" then
            TriggerServerEvent('qb-clothes:loadPlayerSkin')
        elseif ClothingType == "illenium" then
            TriggerEvent('illenium-appearance:client:reloadSkin')
        end
        SetModelAsNoLongerNeeded(originalPedModel)
        originalPedModel = nil
		SetPlayerInvincible(PlayerPedId(), false)
    else
		print('error, incorrect model specified, unable to revert back to original ped model!')
    end
end

--transform into rabbit
function transformToRabbit()
	SaveOriginalPedModel()
    Wait(1000)
	SetFlash(0, 0, 500, 7000, 500)
	ShakeGameplayCam('LARGE_EXPLOSION_SHAKE', 1.00)
	Wait(1000)
	ShakeGameplayCam('DRUNK_SHAKE', 1.10)
	Wait(1000) 
	SetTimecycleModifier('spectator5')
	SetPedMotionBlur(playerPed, true) 
	SetFlash(0, 0, 500, 7000, 500)
	ShakeGameplayCam('LARGE_EXPLOSION_SHAKE', 1.10)
	Wait(1000)
	SetFlash(0, 0, 500, 7000, 500)
	ShakeGameplayCam('LARGE_EXPLOSION_SHAKE', 1.10)
	Wait(1000)
	DoScreenFadeOut(1000)
	Wait(1000)
	ClearTimecycleModifier()
    ResetScenarioTypesEnabled()
    SetRunSprintMultiplierForPlayer(playerPed, 1.0)
    StopGameplayCamShaking(playerPed, true)
    SetPedIsDrunk(playerPed, false)
    SetPedMotionBlur(playerPed, false)
	if IsModelInCdimage(rabbitModel) and IsModelValid(rabbitModel) then
		RequestModel(rabbitModel)
		while not HasModelLoaded(rabbitModel) do
			Wait(0)
		end
		SetPlayerModel(PlayerId(), rabbitModel)
		SetPlayerInvincible(PlayerPedId(), true)
		SetModelAsNoLongerNeeded(rabbitModel)
	end
	Wait(1000)
	DoScreenFadeIn(2500)
	Wait(30 * 1000) -- change duration that the player is the rabbit model for here 30 seconds by default
    SetFlash(0, 0, 500, 7000, 500)
	ShakeGameplayCam('LARGE_EXPLOSION_SHAKE', 1.00)
	Wait(1000)
	ShakeGameplayCam('DRUNK_SHAKE', 1.10)
	Wait(1000) 
	SetTimecycleModifier('spectator5')
	SetFlash(0, 0, 500, 7000, 500)
	ShakeGameplayCam('LARGE_EXPLOSION_SHAKE', 1.10)
	Wait(1000)
	SetFlash(0, 0, 500, 7000, 500)
	ShakeGameplayCam('LARGE_EXPLOSION_SHAKE', 1.10)
	Wait(1000)
    ClearTimecycleModifier()
    ResetScenarioTypesEnabled()
    StopGameplayCamShaking(playerPed, true)
    SetPedIsDrunk(playerPed, false)
    SetPedMotionBlur(playerPed, false)
	RevertToOriginalModel() 
	ClearPedTasks(playerPed)
end





-- function to lock inventory to prevent exploits
function LockInventory(toggle) -- big up to jim for how to do this
	if toggle then
        if InvType == 'qb' then
            TriggerEvent('inventory:client:busy:status', true) TriggerEvent('canUseInventoryAndHotbar:toggle', false)
        elseif InvType == 'ox' then
            LocalPlayer.state:set("inv_busy", true, true)
        end
    else 
        if InvType == 'qb' then
         TriggerEvent('inventory:client:busy:status', false) TriggerEvent('canUseInventoryAndHotbar:toggle', true)
        elseif InvType == 'ox' then
            LocalPlayer.state:set("inv_busy", false, true)
        end
    end
end


--delete spawned easter eggs and rabbits
function deleteSpawned()
    for _, v in pairs(spawnedEggs) do SetEntityAsMissionEntity(v, false, true) DeleteObject(v) end print('Easter Eggs - Objects Deleted')
    for _, v in pairs(spawnedRabbits) do SetEntityAsMissionEntity(v, false, true) DeleteObject(Rabbits) end print('Easter Rabbit - Ped Deleted')
end

--remove target options from easter eggs and rabbits
function removeTargets()
    if TargetType == 'qb' then exports['qb-target']:RemoveTargetEntity(Rabbits, 'Rabbits') elseif TargetType == 'ox' then exports.ox_target:removeLocalEntity(Rabbits, 'Rabbits') end print('Easter Rabbit - Targets Removed')
    if TargetType == 'qb' then exports['qb-target']:RemoveTargetEntity(Eggs, 'Eggs') elseif TargetType == 'ox' then exports.ox_target:removeLocalEntity(Eggs, 'Eggs') end print('Easter Eggs - Targets Removed')
end

--eating animation and prop attachment
function eatAnimation()
    prop = CreateObject(Config.Animations.EatEasterEggs.Prop.Name, GetEntityCoords(playerPed), true, true, true)
    AttachEntityToEntity(prop, playerPed, GetPedBoneIndex(playerPed, Config.Animations.EatEasterEggs.Prop.Bone), Config.Animations.EatEasterEggs.Prop.Placement.x, Config.Animations.EatEasterEggs.Prop.Placement.y, Config.Animations.EatEasterEggs.Prop.Placement.z, Config.Animations.EatEasterEggs.Prop.Rotation.x, Config.Animations.EatEasterEggs.Prop.Rotation.y, Config.Animations.EatEasterEggs.Prop.Rotation.z, true, true, false, false, 1, true) 
    RequestAnimDict(Config.Animations.EatEasterEggs.AnimDict)
    while not HasAnimDictLoaded(Config.Animations.EatEasterEggs.AnimDict) do
        Wait(1000)
    end
    TaskPlayAnim(playerPed, Config.Animations.EatEasterEggs.AnimDict, Config.Animations.EatEasterEggs.Anim, 3.0, 3.0, -1, Config.Animations.EatEasterEggs.Flags, 0, false, false, false)
end

--collecting easter eggs animation
function collectEasterEggsAnim()
    RequestAnimDict(Config.Animations.CollectEasterEggs.AnimDict)
    while not HasAnimDictLoaded(Config.Animations.CollectEasterEggs.AnimDict) do
        Wait(1000)
    end
    TaskPlayAnim(playerPed, Config.Animations.CollectEasterEggs.AnimDict, Config.Animations.CollectEasterEggs.Anim, 1.0, -1.0, 1.0, 11, Config.Animations.CollectEasterEggs.Flags, 0, 0, 0)
    basket = CreateObject('prop_fruit_basket', pedcoords, true, false, false) -- change basket prop here
    AttachEntityToEntity(basket, playerPed, GetPedBoneIndex(playerPed, 57005), 0.26, -0.14, -0.16, -60.0, -50.0, 0.0, true, true, false, false, 1, true) -- change bone index/ postion/ rotation of basket attachment here
end






AddEventHandler('onResourceStop', function(resource)
	if resource == GetCurrentResourceName() then
		busy = false
        deleteSpawned()
        removeTargets()
        print('^5--<^3!^5>-- ^7| Lusty94 |^5 ^5--<^3!^5>--^7 Easter Egg Hunt V1.0.0 Stopped Successfully ^5--<^3!^5>--^7')
	end
end)