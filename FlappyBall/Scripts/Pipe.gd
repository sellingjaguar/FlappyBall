extends KinematicBody2D

var speed:float
var distance:int

var movement:Vector2 = Vector2.ZERO
var initial_x = 0

func _process(delta):
	
	if position.x < initial_x - distance:
		queue_free()
	
	move_and_slide(movement)

func _ready():
	initial_x = position.x
	movement.x = -speed
