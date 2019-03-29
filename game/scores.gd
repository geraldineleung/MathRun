extends Label

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var file = File.new()
	file.open("res://game/Highscores.txt", file.READ)
	var highscores = file.get_as_text()
	file.close()
	self.set_text(highscores)

	#print out the highscores
	text = highscores
	
	
	
	
	
