#> sism:_/impl/set/do
#--------------------
# @api
#--------------------

$loot replace entity @s $(category)$(slot) loot {pools:[{rolls:1,entries:[{type:"minecraft:item",name:"$(id)",functions:[{function:"minecraft:set_count",count:$(count)},{function:"minecraft:set_components", components:$(components)}]}]}]}