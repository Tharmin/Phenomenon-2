extends Label


# Called when the node enters the scene tree for the first time.
func _input(event):
	if Input.is_action_just_pressed("ui_cancel"):
		get_parent().get_child(1).set("visible", true)
		queue_free()
