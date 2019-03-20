extends Area2D

onready var display = preload("res://question_display/question_display.tscn")

func _ready():
	pass

func _physics_process(delta):
	move_gems()

func _on_gem_body_entered(body):
	if body.get_name() == "player":
		get_tree().paused = true

func move_gems():
	translate(Vector2(0,4))

func _on_gem_area_entered(area):
	if area.get_name() == "tree" || area.get_name() == "coin":
		print(area.get_name())