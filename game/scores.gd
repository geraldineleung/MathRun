extends Label

# Declare member variables here. Examples:
var answer = false;


# Called when the node enters the scene tree for the first time.
func _ready():
	var file = File.new()
	file.open("res://game/Highscores.txt", file.READ)
	
	#loop through file
	var names = []
	var score = []
	var scoreline = "\n"
	var index = 0
	
	while not file.eof_reached():
		var line1 = file.get_line()
		var line2 = file.get_line()
		names.append(line1)
		score.append(int(line2))
		print(line2)
		index += 1
	
	file.close()
	
	#sort by highest numbers
	score.sort_custom(self, "customComparison")

	
	#print out the highscores
	var count = 0
	for i in range(index):
		if count < 5:
			scoreline += str(names[i]) + " -----" + str(score[i]) + "\n"
		count += 1
	
	text = scoreline
	


func customComparison(a, b):
    if typeof(a) != typeof(b):
        return typeof(a) > typeof(b)
    else:
        return a > b
	
	
	
