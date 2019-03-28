extends Node

onready var ghost = preload("res://collectibles/ghost.tscn")
onready var coin = preload("res://collectibles/coin.tscn")
onready var tree = preload("res://obstacles/tree.tscn")
onready var ghost_container = get_node("gem_container")
onready var coin_container = get_node("coin_container")
onready var tree_container = get_node("tree_container")
onready var player = preload("res://player/player.gd")


var screensize
var score = 0
const GHOST_TIMER_MAX = 500
const COIN_TIMER_MAX = 50
const TREE_TIMER_MAX = 90
var ghost_spawn_timer = 0
var coin_spawn_timer = 0
var tree_spawn_timer = 0

func _ready():
	randomize()
	screensize = get_viewport().get_visible_rect().size
	set_process(true)
	spawn_coins(2)
	spawn_trees(1)

func _process(delta):
	ghost_spawn_timer+=1
	coin_spawn_timer+=1
	tree_spawn_timer+=1
	if ghost_spawn_timer >= GHOST_TIMER_MAX:
		spawn_ghost(1)
		ghost_spawn_timer = 0
	if coin_spawn_timer >= COIN_TIMER_MAX:
		spawn_coins(1)
		coin_spawn_timer = 0
	if tree_spawn_timer >= TREE_TIMER_MAX:
		spawn_trees(1)
		tree_spawn_timer = 0
	if get_tree().paused == true:
		print("paused")
		show_question()


func spawn_ghost(num):
	for i in range(num):
		var g = ghost.instance()
		ghost_container.add_child(g)
		if g.get_overlapping_areas().size() == 0:
			print(g.get_overlapping_areas())
			g.set_position(Vector2(rand_range(300, screensize.x-270), -20))

func spawn_coins(num):
    for i in range(num):
        var c = coin.instance()
        coin_container.add_child(c)
        c.set_position(Vector2(rand_range(200, screensize.x-200), rand_range(-10, -200)))

func spawn_trees(num):
    for i in range(num):
        var t = tree.instance()
        tree_container.add_child(t)
        t.set_position(Vector2(rand_range(270, 550), rand_range(-10, -300)))
