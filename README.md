## Lusty94_EggHunt


<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

PLEASE MAKE SURE TO READ THIS ENTIRE FILE AS IT COVERS SOME IMPORTANT INFORMATION

<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

======================================
SCRIPT SUPPORT VIA DISCORD: https://discord.gg/BJGFrThmA8
======================================




## Features

- Find and gather easter eggs that are in various locations across the map
- Find the easter bunny for a chance to get a golden easter egg
- Eating easter eggs give you stress relief and replenishes hunger with other configurable buffs
- Golden easter eggs turn the player into an easter bunny for a configurable time [default is 30 seconds]
- Configurable chances to find nothing when searching
- Easily edit config file to suit your own server needs





## DEPENDENCIES

- qb-core - https://github.com/qbcore-framework/qb-core
- qb-target - https://github.com/qbcore-framework/qb-target
- qb-inventory - https://github.com/qbcore-framework/qb-inventory
- qb-clothing - https://github.com/qbcore-framework/qb-clothing
- ox_lib - https://github.com/overextended/ox_lib/releases





## INSTALLATION

- Add the ##ITEMS snippet below into your core items.lua file
- Add all .png images inside [images] folder into your inventory images folder
- Ensure all listed dependencies start BEFORE lusty94_egghunt


## ITEMS

## new qb method
```
    --EASTER EGG HUNT
    easteregg                  = {name = 'easteregg',                   label = 'Chocolate Easter Egg',         weight = 100,         type = 'item',         image = 'easteregg.png',              unique = false,     useable = true,     shouldClose = true,      combinable = nil,   description = ''},
    goldeneasteregg            = {name = 'goldeneasteregg',             label = 'Golden Easter Egg',            weight = 100,         type = 'item',         image = 'goldeneasteregg.png',        unique = false,     useable = true,     shouldClose = true,      combinable = nil,   description = ''},
    eggbasket                  = {name = 'eggbasket',                   label = 'Easter Egg Basket',            weight = 100,         type = 'item',         image = 'eggbasket.png',              unique = false,     useable = true,     shouldClose = true,      combinable = nil,   description = ''},    

```

## old qb method
```

    --EASTER EGG HUNT
    ['easteregg'] 						 = {['name'] = 'easteregg', 			 	  	['label'] = 'Easter Egg', 	            ['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'easteregg.png', 				    ['unique'] = false, 	    ['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = ''},
    ['goldeneasteregg'] 				 = {['name'] = 'goldeneasteregg', 		        ['label'] = 'Golden Easter Egg', 	    ['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'goldeneasteregg.png', 				['unique'] = false, 	    ['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = ''},
    ['eggbasket'] 						 = {['name'] = 'eggbasket', 			 	  	['label'] = 'Egg Basket', 	            ['weight'] = 1000, 		['type'] = 'item', 		['image'] = 'eggbasket.png', 				    ['unique'] = false, 	    ['useable'] = true, 	['shouldClose'] = true,   ['combinable'] = nil,   ['description'] = ''},

```