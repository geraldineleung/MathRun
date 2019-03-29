extends Label

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var file = File.new()
	file.open("res://game/Highscores.txt", file.READ)
	var highscores = file.get_as_text()
	
	#loop through file
	var scoreline = "\n"
	var index = 1
	while not file.eof_reached():
	    var line1 = file.get_line()
	    var line2 = file.get_line()
	    scoreline = scoreline + str(line1) + " --- " + str(line2) + "\n"
	    index += 1
	
	file.close()

	#print out the highscores
	text = scoreline
	
	
	
