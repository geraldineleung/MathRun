extends Button

func _on_quit_button_pressed():
	var game_settings = get_node("/root/game_settings")
	game_settings.current_scene = "Title"
	get_tree().change_scene("res://menu/title_screen/title_screen.tscn")