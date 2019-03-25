extends Node2D

var math_op = ["+", "-", "x"]
var rand_num1 = 0
var rand_num2 = 0
var operand = ""
var right_ans
var wrong_ans1
var wrong_ans2

func _ready():
	pass

func randomize_question():
	randomize()
	rand_num1 = String(randi() % 10)
	rand_num2 = String(randi() % 10)
	operand = math_op[randi() % math_op.size()]

func answers(op):
	match op:
		"+":
			right_ans = int(rand_num1) + int(rand_num2)
			wrong_ans1 = right_ans + 3
			wrong_ans2 = right_ans - 2
		"-":
			if rand_num1 < rand_num2:
				right_ans = int(rand_num2) - int(rand_num1)
			else:
				right_ans = int(rand_num1) - int(rand_num2)
			wrong_ans1 = right_ans + 3
			wrong_ans2 = right_ans - 2
		"x":
			right_ans = int(rand_num1) * int(rand_num2)
			wrong_ans1 = right_ans + 3
			wrong_ans2 = right_ans - 2

func pop_question():
	randomize_question()
	answers(operand)
	$question_popup/question_label.text = rand_num1 + " " + operand + " " + rand_num2
	$question_popup/answer1/ans1_label.text = String(right_ans)
	$question_popup/answer2/ans2_label.text = String(wrong_ans1)
	$question_popup/answer3/ans3_label.text = String(wrong_ans2)
	$question_popup.popup()

func _process(delta):
	if !get_tree().paused:
		$question_popup.hide()