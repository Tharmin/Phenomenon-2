extends Control


func _ready():
	print("from ready: ", get_multiplayer_authority(), ": ", multiplayer.get_unique_id())
	if get_multiplayer_authority() == multiplayer.get_unique_id():
		visible = true
		pause_game()
	else:
		visible = false
		set_process(false)

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
	get_parent().get_child(0).pause()
	$Gameplay.visible = false
	$Settings.visible = true
	get_tree().paused = true
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
