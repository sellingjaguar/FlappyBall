extends RigidBody2D

export(NodePath) var ui_path
var ui

var score:Label

export(float) var jump_force

var movement:Vector2 = Vector2.ZERO

func _ready():
	movement.y = -jump_force
	
	ui = get_node(ui_path)

func _physics_process(delta):
	
	if Input.is_action_just_pressed("jump") and linear_velocity.y > -100:
		
		linear_velocity.y = 0
		apply_central_impulse(movement)



func _on_Player_body_entered(body):
	if not "Score" in body.name:
		get_tree().reload_current_scene()


func _on_Area2D_area_entered(area):
	
	ui.add_score()
