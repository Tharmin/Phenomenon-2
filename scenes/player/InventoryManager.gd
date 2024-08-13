extends Node

var Inventory = []
var CurrentItem: int = 0

func add_item(scene):
	var child = get_node("Slot " + str(CurrentItem)).get_child_count()
	if child == 1 or child == null: 
		print_rich("[rainbow][tornado]Item OwO[/rainbow][/tornado]")
		#Inventory.append(scene)
		pass
	else:
		print_rich("No item")

func slot_check():
	var integer_number_34:int = 0 #Probably unnecessary but better safe than never 
	while integer_number_34 < 7:
		get_node("Slot " + str(CurrentItem))
		pass

func drop_item(index):
	var item = Inventory.pop_at(index)
	# spawn item at the player's current location idk i need ritalin
	
