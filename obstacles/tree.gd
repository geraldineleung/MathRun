#extends Area2D
extends KinematicBody2D

onready var player = get_parent().get_parent().get_node("player")

func _ready():
	get_node("tree_notifier").connect("screen_exited", self, "_on_tree_notifier_screen_exited")

func _physics_process(delta):
	move_trees()

func move_trees():
	translate(Vector2(0,4))

func _on_tree_notifier_screen_exited():
	queue_free()
