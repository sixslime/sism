#> sism:api > set
#--------------------
# [AS] player
# -> item: ItemSlot
# -> path: "Inventory" | "EnderItems"
#--------------------
# ...
#--------------------
#> emulates the would-be behavior of `data modify entity @s <path> append value <item>`.
#--------------------
#- in other words, replaces @s's <item.slot> in <path> with <item>.
#--------------------
# 1 - success
# 0 - invalid <item.slot> value for <path>.
#--------------------

execute unless data storage sism:in set.item.components run data modify storage sism:in set.item.components set value {}
data modify storage sism:var verify set from storage sism:in set
execute unless function sism:api/convert_path run return run function sism:_/impl/set/fail

data modify storage sism:out convert_path.result merge from storage sism:in set.item
function sism:_/impl/set/do with storage sism:out convert_path.result

data remove storage sism:var verify
data remove storage sism:in set
return 1