#> sism:_/impl/set/do
#--------------------
# @api
#--------------------

$loot replace entity @s $(slot_1)$(slot_2) loot {pools:[{rolls:1,entries:[{type:"minecraft:item",name:"$(id)",functions:[{function:"minecraft:set_count",count:$(count)},{function:"minecraft:set_components", components:$(components)}]}]}]}