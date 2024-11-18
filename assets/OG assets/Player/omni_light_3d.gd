@tool
extends OmniLight3D
@export var min_light : float = 0.3
@export var max_light : float = 0.35


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	omni_range = randf_range(min_light, max_light)
