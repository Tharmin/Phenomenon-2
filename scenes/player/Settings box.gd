extends VBoxContainer



func resume() -> void:
	get_parent().get_parent().resume_game()


func quit():
	get_tree().quit()
