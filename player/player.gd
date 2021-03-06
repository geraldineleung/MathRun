extends KinematicBody2D

const SPEED = 400
var movedir = Vector2(0,0)
var spritedir = "up"


func _ready():
	get_node("notifier").connect("screen_exited", self, "_on_notifier_screen_exited")

func _physics_process(delta):
	controls_loop()
	movement_loop()
	spritedir_loop()
	anim_switch("walk")

func controls_loop():
	var LEFT	= Input.is_action_pressed("ui_left")
	var RIGHT	= Input.is_action_pressed("ui_right")
	var UP		= Input.is_action_pressed("ui_up")
	var DOWN	= Input.is_action_pressed("ui_down")
	
	movedir.x = -int(LEFT) + int(RIGHT)
	movedir.y = -int(UP) + int(DOWN)
	
func movement_loop():
	var motion = movedir.normalized() * SPEED
	move_and_slide(motion, Vector2(0,0))
	
func spritedir_loop():
	match movedir:
		Vector2(-1,0):
			spritedir = "left"
		Vector2(1,0):
			spritedir = "right"
		Vector2(0,-1):
			spritedir = "up"
		Vector2(0,1):
			spritedir = "down"

func anim_switch(animation):
	var newanim = str(animation,"up")
	if $anim.current_animation != newanim:
		$anim.play(newanim)

func _on_notifier_screen_exited():
	var game_settings = get_node("/root/game_settings")
	if game_settings.current_scene == "Game":
		game_over()

func game_over():
	get_tree().change_scene("res://game_over.tscn")
