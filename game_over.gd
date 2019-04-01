extends CanvasLayer

onready var info = get_node("/root/new_script")

func _ready():
	
	var lab = get_node("Score")
	lab.set_text("Score: " + str(info.score_current))
	
	
	var file = File.new()
	file.open("res://game/Highscores.txt", file.READ_WRITE)
	file.seek_end()
	file.store_string("Player\n"+ str(info.score_current) +"\n")
	file.close()
	

func _on_quit_button_pressed():
	get_tree().change_scene("res://menu/title_screen/title_screen.tscn")


func _on_restart_button_pressed():
	info.score_current=0
	get_tree().change_scene("res://main.tscn")
	
