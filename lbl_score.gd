#script lbl_script (built-in)
extends Label
onready var info = get_node("/root/new_script")

# Called when the node enters the scene tree for the first time.

func _ready():
	info.connect("score_current_changed",self,"_on_score_current_changed")
	pass # Replace with function body.
func _on_score_current_changed():
	set_text(str(info.score_current))
	pass

