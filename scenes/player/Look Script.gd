extends Node3D

@export var sensitivity:float = 0.0025

func _input(event):
	if event is InputEventMouseMotion:
		get_parent().rotate_y(-event.relative.x * sensitivity)
		rotation_degrees.x = clamp(rotation_degrees.x - rad_to_deg(event.relative.y * sensitivity), -90, 90)
