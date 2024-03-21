Config = {}

--
--██╗░░░░░██╗░░░██╗░██████╗████████╗██╗░░░██╗░█████╗░░░██╗██╗
--██║░░░░░██║░░░██║██╔════╝╚══██╔══╝╚██╗░██╔╝██╔══██╗░██╔╝██║
--██║░░░░░██║░░░██║╚█████╗░░░░██║░░░░╚████╔╝░╚██████║██╔╝░██║
--██║░░░░░██║░░░██║░╚═══██╗░░░██║░░░░░╚██╔╝░░░╚═══██║███████║
--███████╗╚██████╔╝██████╔╝░░░██║░░░░░░██║░░░░█████╔╝╚════██║
--╚══════╝░╚═════╝░╚═════╝░░░░╚═╝░░░░░░╚═╝░░░░╚════╝░░░░░░╚═╝


--Thank you for downloading this script!

--Below you can change multiple options to suit your server needs.

Config.CoreSettings = {
    EventNames = {        
        Stress = 'hud:server:RelieveStress', -- relieve stress event --[[ change amounts in egghunt_client.lua for the eating event ]]
    },
    Target = {
        Type = 'qb', -- support for qb-target and ox_target    
        --use 'qb' for qb-target
        --use 'ox' for ox_target
    },
    Notify = {
        Type = 'qb', -- notification type, support for qb-core notify, okokNotify, mythic_notify, boii_ui notify and ox_lib notify
        --use 'qb' for default qb-core notify
        --use 'okok' for okokNotify
        --use 'mythic' for myhthic_notify
        --use 'boii' for boii_ui notify
        --use 'ox' for ox_lib notify
        Sound = true, -- use sound for OKOK notifications ONLY
        Length = { Success = 2500, Error = 2500, },
    },
    Inventory = { -- support for qb-inventory and ox_inventory
        Type = 'qb',
        --use 'qb' for qb-inventory
        --use 'ox' for ox_inventory
    },
    Clothing = { -- support for qb-clothing and illenium-appearance
        Type = 'qb',
        --use 'qb' for qb-clothing
        --use 'illenium' for illenium-appearance
    },
    Chances = {
        Effects = 75, -- percentage chance to get buffs when eating easter eggs
        FindEasterEgg = 75, -- chance to find normal easter egg when interacting with the easter eggs
        FindGoldenEasterEgg = 50, -- chance to find golden easter egg when interacting with the easter bunny
    },
}

Config.MiniGameSettings = {
    Type = 'progbar', -- type of minigame when collecting easter eggs --[[  EATING EASTER EGGS IS ALWAYS A PROGRESSBAR UNLESS YOU CHANGE IT BUT WHY WOULD YOU FOR EATING ITEMS? ]]
    --use 'progbar' for qb-progressbar
    --use 'skill' for ox_lib skill check

    ProgressBar = { -- qb-progressbar settings
        Times = {
            CollectEasterEggs = 5000, -- time it takes to collect easter eggs
            EatEasterEggs = 3000, -- time to eat easter eggs
        },
    }, 
    SkillCheckSettings = { -- ox_lib skill check settings
        Difficulty = 'easy', -- difficulty level of skill check
        AreaSize = 60, -- area size you have to press the required input
        SpeedMultiplier = 0.5, -- speed of the skill check each pass
        Keys = {'1', '2', '3', '4'}, -- input keys used for skill check
    },
}

Config.Eggs = { -- add or remove easter egg locations here
    {name = 'egg1', coords = vector4(258.32, -786.72, 30.43, 21.96),     useblip = true,   model = 'prop_alien_egg_01', item = 'eggbasket', label = 'Collect Easter Egg', icon = 'fa-solid fa-egg',},
    {name = 'egg2', coords = vector4(140.57, -780.84, 34.9, 347.42),     useblip = true,   model = 'prop_alien_egg_01', item = 'eggbasket', label = 'Collect Easter Egg', icon = 'fa-solid fa-egg',},
    {name = 'egg3', coords = vector4(51.31, -781.93, 44.18, 79.83),      useblip = true,   model = 'prop_alien_egg_01', item = 'eggbasket', label = 'Collect Easter Egg', icon = 'fa-solid fa-egg',},
    {name = 'egg4', coords = vector4(-10.11, -722.76, 46.79, 220.51),    useblip = true,   model = 'prop_alien_egg_01', item = 'eggbasket', label = 'Collect Easter Egg', icon = 'fa-solid fa-egg',},
    {name = 'egg5', coords = vector4(12.28, -898.25, 29.94, 76.11),      useblip = true,   model = 'prop_alien_egg_01', item = 'eggbasket', label = 'Collect Easter Egg', icon = 'fa-solid fa-egg',},
    {name = 'egg6', coords = vector4(-57.77, -957.16, 32.89, 272.21),    useblip = true,   model = 'prop_alien_egg_01', item = 'eggbasket', label = 'Collect Easter Egg', icon = 'fa-solid fa-egg',},
    {name = 'egg7', coords = vector4(-127.05, -1106.08, 30.14, 251.08),  useblip = true,   model = 'prop_alien_egg_01', item = 'eggbasket', label = 'Collect Easter Egg', icon = 'fa-solid fa-egg',},
    {name = 'egg8', coords = vector4(-245.38, -1123.33, 23.02, 124.4),   useblip = true,   model = 'prop_alien_egg_01', item = 'eggbasket', label = 'Collect Easter Egg', icon = 'fa-solid fa-egg',},
    {name = 'egg9', coords = vector4(-496.96, -1065.96, 26.35, 43.27),   useblip = true,   model = 'prop_alien_egg_01', item = 'eggbasket', label = 'Collect Easter Egg', icon = 'fa-solid fa-egg',},
    {name = 'egg10', coords = vector4(-541.11, -1220.11, 19.87, 77.98),  useblip = true,   model = 'prop_alien_egg_01', item = 'eggbasket', label = 'Collect Easter Egg', icon = 'fa-solid fa-egg',},
    {name = 'egg11', coords = vector4(-666.18, -1375.95, 14.4, 53.43),   useblip = true,   model = 'prop_alien_egg_01', item = 'eggbasket', label = 'Collect Easter Egg', icon = 'fa-solid fa-egg',},
    {name = 'egg12', coords = vector4(-637.14, -1249.77, 11.81, 177.47), useblip = true,   model = 'prop_alien_egg_01', item = 'eggbasket', label = 'Collect Easter Egg', icon = 'fa-solid fa-egg',},
    {name = 'egg13', coords = vector4(-763.36, -1088.17, 13.07, 171.58), useblip = true,   model = 'prop_alien_egg_01', item = 'eggbasket', label = 'Collect Easter Egg', icon = 'fa-solid fa-egg',},
    {name = 'egg14', coords = vector4(-888.66, -853.24, 20.57, 282.66),  useblip = true,   model = 'prop_alien_egg_01', item = 'eggbasket', label = 'Collect Easter Egg', icon = 'fa-solid fa-egg',},
    {name = 'egg15', coords = vector4(-281.2, -888.51, 34.23, 198.28),   useblip = true,   model = 'prop_alien_egg_01', item = 'eggbasket', label = 'Collect Easter Egg', icon = 'fa-solid fa-egg',},
    {name = 'egg16', coords = vector4(233.22, -756.47, 37.86, 151.06),   useblip = true,   model = 'prop_alien_egg_01', item = 'eggbasket', label = 'Collect Easter Egg', icon = 'fa-solid fa-egg',},
    {name = 'egg17', coords = vector4(262.83, -634.53, 42.99, 348.45),   useblip = true,   model = 'prop_alien_egg_01', item = 'eggbasket', label = 'Collect Easter Egg', icon = 'fa-solid fa-egg',},
    {name = 'egg18', coords = vector4(287.48, -577.36, 43.38, 44.77),    useblip = true,   model = 'prop_alien_egg_01', item = 'eggbasket', label = 'Collect Easter Egg', icon = 'fa-solid fa-egg',},
    {name = 'egg19', coords = vector4(207.67, -599.38, 44.74, 64.82),    useblip = true,   model = 'prop_alien_egg_01', item = 'eggbasket', label = 'Collect Easter Egg', icon = 'fa-solid fa-egg',},
    {name = 'egg20', coords = vector4(187.71, -786.23, 47.57, 59.47),    useblip = true,   model = 'prop_alien_egg_01', item = 'eggbasket', label = 'Collect Easter Egg', icon = 'fa-solid fa-egg',},
}



Config.Animations = { -- change animations for tasks here
    CollectEasterEggs = { AnimDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@", Anim = "machinic_loop_mechandplayer", Flags = 49, },
    EatEasterEggs = { AnimDict = "mp_player_inteat@burger", Anim = "mp_player_int_eat_burger", Flags = 49, Prop = { Name = 'prop_choc_ego', Bone = 60309, Placement = { x = 0.0, y = 0.0, z = 0.0, }, Rotation = { x = 0.0, y = 0.0, z = 0.0, }, }, },
}