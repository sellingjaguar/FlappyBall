extends CanvasLayer

var score:int = 0

func _process(delta):
	
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().paused = !get_tree().paused
		$Paused.visible = get_tree().paused

func add_score():
	score += 1
	$Score.bbcode_text = "[center]" + str(score) + "[/center]"
