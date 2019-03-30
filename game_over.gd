extends CanvasLayer

onready var info = get_node("/root/new_script")
func _on_quit_button_pressed():
	get_tree().change_scene("res://menu/title_screen/title_screen.tscn")


func _on_restart_button_pressed():
	info.score_current=0
	get_tree().change_scene("res://main.tscn")
	
