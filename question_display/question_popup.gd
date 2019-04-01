extends Node2D

onready var info = get_node("/root/new_script")

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

func get_questions_by_difficulty():
	if game_settings.difficulty == "Easy":
		randomize_question_easy()
	elif game_settings.difficulty == "Medium":
		randomize_question_medium()
	elif game_settings.difficulty == "Hard":
		randomize_question_hard()

func randomize_question_easy():
	randomize()
	rand_num1 = randi() % 10
	rand_num2 = randi() % 10
	operand = math_op[randi() % math_op.size()]

func randomize_question_medium():
	randomize()
	rand_num1 = randi() % 100
	operand = math_op[randi() % math_op.size()]
	if operand == "x":
		rand_num2 = randi() % 10
	else:
		rand_num2 = randi() % 100

func randomize_question_hard():
	randomize()
	rand_num1 = randi() % 1000
	operand = math_op[randi() % math_op.size()]
	if operand == "x":
		rand_num2 = randi() % 10
	elif operand == "-":
		rand_num2 = randi() % 100
	else:
		rand_num2 = randi() % 1000

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
			right_ans = rand_num1 + rand_num2
			wrong_ans1 = right_ans + 3
			wrong_ans2 = right_ans + 2
		"-":
			if rand_num1 < rand_num2:
				right_ans = rand_num2 - rand_num1
			else:
				right_ans = rand_num1 - rand_num2
			wrong_ans1 = right_ans + 5
			wrong_ans2 = right_ans + 2

		"x":
			right_ans = rand_num1 * rand_num2
			if right_ans == 0:
				if rand_num1 == 0 and rand_num2 == 0:
					wrong_ans1 = rand_num1 + 2
					wrong_ans2 = rand_num2 + 5
				elif rand_num1 == 0 and rand_num2 != 0:
					wrong_ans1 = rand_num2 + 3
					wrong_ans2 = rand_num2
				elif rand_num2 == 0 and rand_num1 != 0:
					wrong_ans1 = rand_num1 + 3
					wrong_ans2 = rand_num1
				
			else:
				wrong_ans1 = rand_num1 * (rand_num2)+3
				wrong_ans2 = rand_num1 * (rand_num2)+1
	answers.append(right_ans)
	answers.append(wrong_ans1)
	answers.append(wrong_ans2)

func pop_question():
	get_questions_by_difficulty()
	answers(operand)
	if operand == "-":
		if rand_num1 < rand_num2:
			$question_popup/question_label.text = str(rand_num2) + " " + operand + " " + str(rand_num1)
		else:
			$question_popup/question_label.text = str(rand_num1) + " " + operand + " " + str(rand_num2)
	else:
		$question_popup/question_label.text = str(rand_num1) + " " + operand + " " + str(rand_num2)
	$question_popup/answer1/ans1_label.text = randomize_answer()
	$question_popup/answer2/ans2_label.text = randomize_answer()
	$question_popup/answer3/ans3_label.text = randomize_answer()
	$question_popup.popup()

func _process(delta):
	if !get_tree().paused:
		$question_popup.hide()

func _on_answer1_pressed():
	if $question_popup/answer1/ans1_label.text == str(right_ans):
		info.score_current+=20
		print("good")
	else:
		info.score_current-=10
		if info.score_current < 0:
			info.score_current = 0
		print("wrong")
	get_tree().paused = false


func _on_answer2_pressed():
	if $question_popup/answer2/ans2_label.text == str(right_ans):
		info.score_current+=20
		print("good")
	else:
		info.score_current-=10
		if info.score_current < 0:
			info.score_current = 0
		print("wrong")
	get_tree().paused = false


func _on_answer3_pressed():
	if $question_popup/answer3/ans3_label.text == str(right_ans):
		info.score_current+=20
		print("good")
	else:
		info.score_current-=10
		if info.score_current < 0:
			info.score_current = 0
		print("wrong")
	get_tree().paused = false
