extends Label

# Declare member variables here. Examples:
var answer = false;


# Called when the node enters the scene tree for the first time.
func _ready():
	var file = File.new()
	file.open("res://game/Highscores.txt", file.READ)
	
	#loop through file
	var final = []
	var scoreline = "\n"
	var index = 0
	
	while not file.eof_reached():
		var line1 = file.get_line()
		var line2 = file.get_line()
		var temp = []
		temp.append(line1)
		temp.append(int(line2))
		final.append(temp)
		index += 1
	
	file.close()
	
	#sort by highest numbers
	final.sort_custom(self, "customComparison")


	
	#print out the highscores
	var count = 0
	for i in range(index):
		if count < 5:
			scoreline += str(final[i][0]) + " -----" + str(final[i][1]) + "\n"
		count += 1
	
	text = scoreline
	


func customComparison(a, b):
    if typeof(a) != typeof(b):
        return typeof(a[1]) > typeof(b[1])
    else:
        return a[1] > b[1]
	
	
	
