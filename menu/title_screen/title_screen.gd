extends Control


func _ready():
	var game_settings = get_node("/root/game_settings")
	game_settings.current_scene = "Title"
	for button in $Menu/CenterRow/Buttons.get_children():
		button.connect("pressed", self, "_on_Button_pressed", [button.scene_to_load])

func _on_Button_pressed(scene_to_load):
	get_tree().change_scene(scene_to_load)
