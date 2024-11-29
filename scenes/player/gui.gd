extends Control


func _ready():
	pause_game()


func _input(event):
	if event is InputEventKey:
			if Input.is_action_just_pressed("ui_cancel"):
				if get_tree().paused:
					resume_game()
				else:
					pause_game()


func resume_game():
	$Gameplay.visible = true
	$Settings.visible = false
	get_tree().paused = false
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func pause_game():
	$Gameplay.visible = false
	$Settings.visible = true
	get_tree().paused = true
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
