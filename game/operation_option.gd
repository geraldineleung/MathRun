extends VBoxContainer

# Declare member variables here. Examples:
# game_settings.operation = ["+", "-", "x"]

export(NodePath) var dropdown_path
onready var ButtonPath = get_node(dropdown_path)

# Called when the node enters the scene tree for the first time.
func _ready():
	
	load_operations()
	
	for button in ButtonPath.get_children():
		button.connect("pressed", self, "_on_Button_pressed",[button])
		
	
	check_none_selected()
		


func load_operations():
	
	print("load")



func _on_Button_pressed(button):
	
	if button.name == 'AddBox':
		if button.pressed == true:
			game_settings.add_bool = true
			game_settings.operation.append("+")
		else:
			game_settings.add_bool = false
			game_settings.operation.erase("+")
	if button.name == 'SubBox':
		if button.pressed == true:
			game_settings.sub_bool = true
			game_settings.operation.append("-")
		else:
			game_settings.sub_bool = false
			game_settings.operation.erase("-")
	if button.name == 'MultBox':
		if button.pressed == true:
			game_settings.mult_bool = true
			game_settings.operation.append("x")
		else:
			game_settings.mult_bool = false
			game_settings.operation.erase("x")
	
	print(game_settings.operation)



#set all to true if the user selects none
func check_none_selected():
	
	if (game_settings.add_bool == false) and (game_settings.sub_bool == false) and (game_settings.mult_bool == false):
		game_settings.add_bool = true
		game_settings.sub_bool = true
		game_settings.mult_bool = true
		game_settings.operation = ["+", "-", "x"]
	

