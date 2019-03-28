extends CanvasLayer

func _on_quit_button_pressed():
	get_tree().change_scene("res://menu/title_screen/title_screen.tscn")


func _on_restart_button_pressed():
	get_tree().change_scene("res://main.tscn")
	
