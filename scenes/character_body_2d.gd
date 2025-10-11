extends CharacterBody2D

@export var speed = 500

func get_input():
	

	
	if Input.is_action_pressed("move_right"):
		$AnimatedSprite2D.play("walk_right")
	elif Input.is_action_pressed("move_up"):
		$AnimatedSprite2D.play("walk_up")
	elif Input.is_action_pressed("move_down"):
		$AnimatedSprite2D.play("walk_down")
	else: 
		$AnimatedSprite2D.play("walk_down")
	
	
	
func _physics_process(delta):
	get_input()
	move_and_slide()
	
		

	
		
	
	
