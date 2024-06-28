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

data modify storage sism:var verify set from storage sism:in set
execute unless function sism:_/verify/o run return run function sism:_/impl/set/fail

data modify storage sism:var verify.out merge from storage sism:in set.item
function sism:_/impl/set/do with storage sism:var verify.out

data remove storage sism:var verify
data remove storage sism:in set
return 1