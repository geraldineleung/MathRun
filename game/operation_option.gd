extends VBoxContainer

# Declare member variables here. Examples:
# game_settings.operation = ["+", "-", "x"]

export(NodePath) var dropdown_path
onready var ButtonPath = get_node(dropdown_path)

# Called when the node enters the scene tree for the first time.
func _ready():
	
	#print(get_parent().handle_this_button_press(CheckBox1))
	
	game_settings.operation = ["+", "-", "x"]
	
	for button in ButtonPath.get_children():
		button.connect("pressed", self, "_on_Button_pressed",[button])
		

func _on_Button_pressed(button):
	print(button.pressed)
	
	if button.name == 'AddBox':
		print("hi")
	if button.name == 'SubBox':
		print("hey")
	if button.name == 'MultBox':
		print("hello")



