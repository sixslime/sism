#> sism:api > convert_path
#--------------------
# -> slot: byte
# -> path: "Inventory" | "EnderItems"
#--------------------
# <- result: ItemPathArg
#--------------------
#> converts a <slot> and <path> to a ItemPathArg.
#--------------------
#- ItemPathArg is meant to be used with a macro line with commands like such:
#  `$item modify entity @s $(category)$(slot) ...`
#--------------------
# 1 - success
# 0 - invalid <slot> and <path> combination
#--------------------

execute store result score *convert_path.slot -sism run data get storage sism:in convert_path.slot
scoreboard players set *convert_path.path -sism 0
execute if data storage sism:in convert_path{path:"Inventory"} run scoreboard players set *convert_path.path -sism 1
execute if data storage sism:in convert_path{path:"EnderItems"} run scoreboard players set *convert_path.path -sism 2

execute unless score *convert_path.path -sism matches 1..2 run return run function sism:_/impl/convert_path/fail
execute if score *convert_path.path -sism matches 1 unless score *convert_path.slot -sism matches 0..35 unless score *convert_path.slot -sism matches 100..103 unless score *convert_path.slot -sism matches -106 run return run function sism:_/impl/convert_path/fail
execute if score *convert_path.path -sism matches 2 unless score *convert_path.slot -sism matches 0..26 run return run function sism:_/impl/convert_path/fail

execute if score *convert_path.slot -sism matches 0..35 run data modify storage sism:out convert_path.category set value "container."
execute if score *convert_path.path -sism matches 2 run data modify storage sism:out convert_path.category set value "enderchest."
execute if score *convert_path.slot -sism matches 0..35 store result storage sism:out convert_path.slot int 1 run scoreboard players get *convert_path.slot -sism
execute if score *convert_path.slot -sism matches 100..103 run data modify storage sism:out convert_path.category set value "armor."
execute if score *convert_path.slot -sism matches 100 run data modify storage sism:out convert_path.slot set value "feet"
execute if score *convert_path.slot -sism matches 101 run data modify storage sism:out convert_path.slot set value "legs"
execute if score *convert_path.slot -sism matches 102 run data modify storage sism:out convert_path.slot set value "chest"
execute if score *convert_path.slot -sism matches 103 run data modify storage sism:out convert_path.slot set value "head"
execute if score *convert_path.slot -sism matches -106 run data merge storage sism:out {convert_path:{category:"weapon.", slot:"offhand"}}

data remove storage sism:in convert_path
scoreboard players reset *convert_path.path -sism 
scoreboard players reset *convert_path.slot -sism
return 1
