extends Panel

# Declare member variables here. Examples:


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _on_PlayButton_pressed():
	game_settings.username = get_node("LineEdit").get_text()
	
	if game_settings.username == "":
		game_settings.username = "Player"
		
	
	get_tree().change_scene('res://main.tscn')
	

