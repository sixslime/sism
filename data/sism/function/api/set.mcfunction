#> sism:api > set
#--------------------
# [AS] player
# -> item: ItemSlot
# -> path: "Inventory" | "EnderItems"
#--------------------
# ...
#--------------------
#> emulates the would-be behavior of `data modify entity [player] <path> append value <item>`.
#--------------------
#- in other words, replaces [player]'s <item.slot> in <path> with <item>.
#--------------------
# 1 - success
# 0 - invalid <item.Slot> value for <path>.
#--------------------

execute store result score *slot --sism run data get storage sism:in set.item.Slot
scoreboard players set *path --sism 0
execute if data storage sism:in set{path:"Inventory"} run scoreboard players set *path --sism 1
execute if data storage sism:in set{path:"EnderItems"} run scoreboard players set *path --sism 2

execute unless score *path --sism matches 1..2 run return run function sism:_/impl/set/fail
execute if score *path --sism matches 1 unless score *slot --sism matches 0..35 unless score *slot --sism matches 100..103 unless score *slot --sism matches -106 run return run function sism:_/impl/set/fail
execute if score *path --sism matches 2 unless score *slot --sism matches 0..26 run return run function sism:_/impl/set/fail

data modify storage sism:var set.with set from storage sism:in set.item
execute if score *slot --sism 

data remove storage sism:in set
data remove storage sism:var set