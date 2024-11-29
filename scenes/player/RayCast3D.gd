extends RayCast3D
var root

@onready var RootPlayer = get_parent().get_parent().get_parent()
# Called when the node enters the scene tree for the first time.
func _ready():
	root = get_tree()
	print(root.root.get_child(0))
	#process_mode = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_colliding():
		RootPlayer.get_child(3).get_child(0).get_child(0).text =  str(get_collider().item_scene)
	else:
		RootPlayer.get_child(3).get_child(0).get_child(0).text = ""
