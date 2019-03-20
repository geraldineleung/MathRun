#extends Area2D
extends KinematicBody2D

onready var player = get_parent().get_parent().get_node("player")

func _ready():
	pass

func _physics_process(delta):
	move_trees()

func _on_tree_body_entered(body):
	if body.get_name() == "player":
		print(player)
		player.move_and_collide(Vector2(0,0))

func move_trees():
	translate(Vector2(0,4))
