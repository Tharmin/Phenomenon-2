extends Node

@export var item_scene:PackedScene
@export var item_mesh:Mesh


func _ready():
	if item_scene == null:
		queue_free()
	if item_mesh != null:
		$MeshInstance3D.mesh = item_mesh
