extends Area2D

#onready var popup = preload("res://question_display/question_popup.tscn")
var p

func _ready():
	p = get_tree().get_root().find_node("question_popup_container",true,false)
	pass

func _physics_process(delta):
	move_gems()

func _on_gem_body_entered(body):
	if body.get_name() == "player":
		get_tree().paused = true
		show_question()

func move_gems():
	translate(Vector2(0,4))



func show_question():
	print("paused")
	p.pop_question()
	
	