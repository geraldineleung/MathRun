extends Button

func _on_pause_button_pressed():
	if !get_tree().paused:
		get_tree().paused = true
		$pause.text = "CONTINUE"
	else:
		get_tree().paused = false
		$pause.text = "PAUSE"
