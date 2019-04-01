extends Button
onready var info = get_node("/root/new_script")

func _on_quit_button_pressed():
	var game_settings = get_node("/root/game_settings")
	game_settings.current_scene = "Title"
	info.score_current = 0
	get_tree().change_scene("res://menu/title_screen/title_screen.tscn")