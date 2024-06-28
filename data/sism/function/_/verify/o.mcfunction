#> sism:_/verify/o
#--------------------
# api/set
#--------------------

execute store result score *verify.slot -sism run data get storage sism:var verify.item.Slot
scoreboard players set *verify.path -sism 0
execute if data storage sism:var verify{path:"Inventory"} run scoreboard players set *verify.path -sism 1
execute if data storage sism:var verify{path:"EnderItems"} run scoreboard players set *verify.path -sism 2

execute unless score *verify.path -sism matches 1..2 run return run function sism:_/verify/fail
execute if score *verify.path -sism matches 1 unless score *verify.slot -sism matches 0..35 unless score *verify.slot -sism matches 100..103 unless score *verify.slot -sism matches -106 run return run function sism:_/verify/fail
execute if score *verify.path -sism matches 2 unless score *verify.slot -sism matches 0..26 run return run function sism:_/verify/fail

data modify storage sism:var set.with set from storage sism:in set.item
execute if score *verify.slot -sism matches 0..35 run data modify storage sism:var verify.out.slot_1 set value "container."
execute if score *verify.slot -sism matches 0..35 store result storage sism:var verify.out.slot_2 int 1 run scoreboard players get *verify.slot -sism
execute if score *verify.slot -sism matches 100..103 run data modify storage sism:var verify.out.slot_1 set value "armor."
execute if score *verify.slot -sism matches 100 run data modify storage sism:var verify.out.slot_2 set value "feet"
execute if score *verify.slot -sism matches 101 run data modify storage sism:var verify.out.slot_2 set value "legs"
execute if score *verify.slot -sism matches 102 run data modify storage sism:var verify.out.slot_2 set value "chest"
execute if score *verify.slot -sism matches 103 run data modify storage sism:var verify.out.slot_2 set value "head"
execute if score *verify.slot -sism matches -106 run data merge storage sism:var {verify:{out:{slot_1:"weapon.", slot_2:"offhand"}}}

scoreboard players reset *verify.path -sism 
scoreboard players reset *verify.slot -sism
return 1