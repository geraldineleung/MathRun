extends OptionButton

# Declare member variables here. Examples:
var difficulty = "Easy"
var operation = "+"

export(NodePath) var dropdown_path
onready var OperationsButton = get_node(dropdown_path)

# Called when the node enters the scene tree for the first time.
func _ready():
	
	OperationsButton.connect("item_selected",self,"on_item_selected")
	
	add_items()
	

func add_items():
	OperationsButton.add_item("+")
	OperationsButton.add_item("-")
	OperationsButton.add_item("x")
	
	
func on_item_selected(id):
	operation = str(OperationsButton.get_item_text(id))
	print(operation)

