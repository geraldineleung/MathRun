extends VBoxContainer

# Declare member variables here. Examples:
var difficulty = "Easy"
var operation = "+"

export(NodePath) var dropdown_path
onready var DifficultyButton = get_node(dropdown_path)
onready var OperationsButton = get_node(dropdown_path)

# Called when the node enters the scene tree for the first time.
func _ready():
	
	DifficultyButton.connect("item_selected",self,"on_item_selected")
	
	add_items()
	

func add_items():
	DifficultyButton.add_item("Easy")
	DifficultyButton.add_item("Medium")
	DifficultyButton.add_item("Hard")
	
	
func on_item_selected(id):
	difficulty = str(DifficultyButton.get_item_text(id))
	print(difficulty)

