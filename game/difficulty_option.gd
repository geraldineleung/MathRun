extends OptionButton

# Declare member variables here. Examples:

export(NodePath) var dropdown_path
onready var DifficultyButton = get_node(dropdown_path)

# Called when the node enters the scene tree for the first time.
func _ready():
	
	add_items()
	
	DifficultyButton.text = game_settings.difficulty
	
	
	DifficultyButton.connect("item_selected",self,"on_item_selected")




func add_items():
	DifficultyButton.add_item("Easy")
	DifficultyButton.add_item("Medium")
	DifficultyButton.add_item("Hard")
	
	
func on_item_selected(id):
	game_settings.difficulty = str(DifficultyButton.get_item_text(id))

	