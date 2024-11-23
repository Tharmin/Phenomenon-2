extends RayCast3D
var root
# Called when the node enters the scene tree for the first time.
func _ready():
	root = get_tree()
	print(root.root.get_child(0))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_colliding():
		root.get_child().text =  str(get_collider().item_scene)
	else:
		$Label.text = ""
