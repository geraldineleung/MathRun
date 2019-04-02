extends Button
onready var info = get_node("/root/new_script")

func _on_quit_button_pressed():
	var game_settings = get_node("/root/game_settings")
	game_settings.current_scene = "Title"
	
	#save highscore
	var file = File.new()
	file.open("res://game/Highscores.txt", file.READ_WRITE)
	file.seek_end()
	file.store_string("\n" + str(game_settings.username) + "\n"+ str(info.score_current))
	file.close()
	
	info.score_current = 0
	get_tree().change_scene("res://menu/title_screen/title_screen.tscn")