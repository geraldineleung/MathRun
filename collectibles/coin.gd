extends Area2D

func _ready():
	get_node("coin_notifier").connect("screen_exited", self, "_on_coin_notifier_screen_exited")

func _physics_process(delta):
	move_coins()
	#spin_coin("spin")

func _on_coin_body_entered(body):
	if body.get_name() == "player":
		queue_free()

func move_coins():
	translate(Vector2(0,4))

func spin_coin(animation):
	var newanim = str(animation,"spin")
	if $anim.current_animation != newanim:
		$anim.play(newanim)

func _on_coin_notifier_screen_exited():
	queue_free()
