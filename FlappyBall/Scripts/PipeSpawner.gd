extends Node2D

var score_area_resource:Resource = load("res://Scenes/ScoreArea.tscn")

export(Resource) var pipe_resource
export(float) var delay
export(float) var speed
export(int) var distance
export(int) var height_variation
export(int) var gap_between_pipes

var pipe_counter = 0

func _ready():
	
	var timer:Timer = Timer.new()
	timer.set_wait_time(delay)
	timer.set_one_shot(false)
	timer.connect("timeout", self, "spawn_pipe")
	add_child(timer)
	timer.start()

func spawn_pipe():
	
	pipe_counter += 1
	
	var pipes:PoolStringArray = ["pipe_bot", "pipe_top"]
	var y = 0
	y = rand_range(-height_variation, height_variation)
	var addition = gap_between_pipes/2
	
	for pname in pipes:
		var pipe = pipe_resource.instance()
		pipe.name = pname + str(pipe_counter)
		
		var y1 = y
		if "top" in pname:
			pipe.rotation_degrees = 180
			addition *= -1
		
		y1 += addition
		
		pipe.position = Vector2(0, y1)
		pipe.speed = speed
		pipe.distance = distance
		
		add_child(pipe)
	
	var score_area = score_area_resource.instance()
	score_area.name = "ScoreArea" + str(pipe_counter)
	
	score_area.scale.y = gap_between_pipes/2
	
	score_area.position = Vector2(0, y)
	
	score_area.speed = speed
	score_area.distance = distance
	
	add_child(score_area)
	
#	print("Pipes " + str(pipe_counter) + " spawned on y=" + str(y))
	
	pass
