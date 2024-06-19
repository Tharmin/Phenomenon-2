extends Node

var Inventory = []
var CurrentItemIndex: int = 0
var InventoryMaxSize = 9

func add_item(scene):
	if Inventory.size() >= InventoryMaxSize:
		# return error
		pass
	else:
		Inventory.append(scene)

func drop_item(index):
	var item = Inventory.pop_at(index)
	# spawn item at the player's current location idk i need ritalin
	
func use_current_item():
	pass

# todo:
# 
# make add_item() functional
# 
# - equip item
# - consume item
# - 
