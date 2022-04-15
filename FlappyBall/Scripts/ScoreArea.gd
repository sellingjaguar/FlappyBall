extends Area2D

var speed:float
var distance:int

var movement:Vector2 = Vector2.ZERO
var initial_x = 0

func _process(delta):
	
	if position.x < initial_x - distance:
		queue_free()
	
	position += movement/2 * delta

func _ready():
	initial_x = position.x
	movement.x = -speed
