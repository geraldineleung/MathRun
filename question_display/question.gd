extends RichTextLabel

var question = ["5 + 3"]
var page = 0


func _ready():
	set_bbcode(question[page])
	#set_visible_characters(0)

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
