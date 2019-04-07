extends CanvasLayer

onready var info = get_node("/root/new_script")

func _ready():
	var game_settings = get_node("/root/game_settings")
	game_settings.current_scene = "GameOver"
	
	var lab = get_node("Score")
	lab.set_text(str(game_settings.username) + "'s" + " Score: " + str(info.score_current))
	
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
	
  
func _on_quit_button_pressed():
	info.score_current=0
	get_tree().change_scene("res://menu/title_screen/title_screen.tscn")


func _on_restart_button_pressed():
	info.score_current=0
	get_tree().change_scene("res://main.tscn")
	
