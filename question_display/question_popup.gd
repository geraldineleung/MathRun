extends Node2D

var math_op = ["+", "-", "x"]
var rand_num1 = 1
var rand_num2 = 1
var operand = ""
var right_ans
var wrong_ans1
var wrong_ans2
var answers = []
var ans

func _ready():
	pass

func randomize_question():
	randomize()
	rand_num1 = str(randi() % 10)
	rand_num2 = str(randi() % 10)
	operand = math_op[randi() % math_op.size()]

func randomize_answer():
	randomize()
	var result_ans
	if answers.size() != 0:
		ans = answers[randi() % answers.size()]
		result_ans = ans
		answers.erase(ans)
	return str(result_ans)

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
			wrong_ans1 = int(rand_num1) * (int(rand_num2)+3)
			wrong_ans2 = int(rand_num1) * (int(rand_num2)+1)
	answers.append(right_ans)
	answers.append(wrong_ans1)
	answers.append(wrong_ans2)

func pop_question():
	randomize_question()
	answers(operand)
	$question_popup/question_label.text = rand_num1 + " " + operand + " " + rand_num2
	$question_popup/answer1/ans1_label.text = randomize_answer()
	$question_popup/answer2/ans2_label.text = randomize_answer()
	$question_popup/answer3/ans3_label.text = randomize_answer()
	$question_popup.popup()

func _process(delta):
	if !get_tree().paused:
		$question_popup.hide()

func _on_answer1_pressed():
	if $question_popup/answer1/ans1_label.text == str(right_ans):
		print("good")
	else:
		print("wrong")
	get_tree().paused = false


func _on_answer2_pressed():
	if $question_popup/answer2/ans2_label.text == str(right_ans):
		print("good")
	else:
		print("wrong")
	get_tree().paused = false


func _on_answer3_pressed():
	if $question_popup/answer3/ans3_label.text == str(right_ans):
		print("good")
	else:
		print("wrong")
	get_tree().paused = false
