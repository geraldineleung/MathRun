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
	var names = {}
	var score = {}
	var scoreline = "\n"
	var index = 1
	
	while not file.eof_reached():
		var line1 = file.get_line()
		var line2 = file.get_line()
		names[str(index)] = line1
		score[str(index)] = line2
		scoreline += line1 + "---" + line2 + "\n"
		index += 1
	
	file.close()
	
	#sort by highest numbers
	
	#print out the highscores
	text = scoreline
	
	#TODO: how to sort by highest number?
	
	
	
