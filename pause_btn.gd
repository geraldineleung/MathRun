extends Button

func _on_pause_btn_pressed():
	if !get_tree().paused:
		get_tree().paused = true
		$pause_label.text = "CONTINUE"
	else:
		get_tree().paused = false
		$pause_label.text = "PAUSE"
		
