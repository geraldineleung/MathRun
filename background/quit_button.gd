extends Button
onready var info = get_node("/root/new_script")

func _on_quit_button_pressed():
	if get_tree().paused:
		get_tree().paused = false
	var game_settings = get_node("/root/game_settings")
	game_settings.current_scene = "Title"
	
	#save highscore
	var path = ProjectSettings.globalize_path("user://") + "Highscores.txt"
	var file = File.new()
	if file.file_exists(path):
		file.open(path, file.READ_WRITE)
		file.seek_end()
		file.store_string("\n" + str(game_settings.username) + "\n"+ str(info.score_current))
		file.close()
	else:
		file.open(path, file.WRITE)
		file.store_string(str(game_settings.username) + "\n"+ str(info.score_current))
		file.close()
	info.score_current = 0
	get_tree().change_scene("res://menu/title_screen/title_screen.tscn")