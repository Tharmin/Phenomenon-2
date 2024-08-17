extends Node

@export var item_scene:PackedScene
@export var item_mesh:Mesh


func _ready():
	var fake = load("res://addons/BugReporter/example_game/coin.tscn").instantiate()
	if item_scene == null:
		queue_free()
	if item_mesh != null:
		$MeshInstance3D.mesh = item_mesh
