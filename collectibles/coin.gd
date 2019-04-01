extends Area2D
onready var info = get_node("/root/new_script")
func _ready():

	get_node("coin_notifier").connect("screen_exited", self, "_on_coin_notifier_screen_exited")

func _physics_process(delta):
	move_coins()
	#spin_coin("spin")

func _on_coin_body_entered(body):
	if body.get_name() == "player":
		#print("old score",score_current)
		info.score_current+=1
		#print(info.score_current)
		#_addScore(5)
		queue_free()
		
#var score=0
#func _addScore(val):
#	main.score_current+=val
#	$Label.set_text(score)
	
func move_coins():
	translate(Vector2(0,4))

func spin_coin(animation):
	var newanim = str(animation,"spin")
	if $anim.current_animation != newanim:
		$anim.play(newanim)

func _on_coin_notifier_screen_exited():
	queue_free()


