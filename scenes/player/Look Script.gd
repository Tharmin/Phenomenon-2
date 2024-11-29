extends Node3D

@export var sensitivity:float = 0.0025

@onready var mouse_motion = get_parent().get_child(5)


func _physics_process(delta: float):
	get_parent().rotate_y(-mouse_motion.Camera.x * sensitivity)
	rotation_degrees.x = clamp(rotation_degrees.x - rad_to_deg(mouse_motion.Camera.y * sensitivity), -90, 90)
