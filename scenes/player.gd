extends CharacterBody2D

@export var speed = 400
@onready var bullet = preload("res://scenes/beer.tscn")
var b 

func _psychics_process (delta):
	var direction = 0
	
	if Input.is_action_just_pressed("right"):
		direction += 1
	if Input.is_action_just_pressed("left"):
		direction -= 1 
	velocity.x = direction * speed
	move_and_slide()

func _physics_process(delta):
	_psychics_process(delta)
	move_and_slide()
	shoot()
	
	

func shoot(): 
	if Input.is_action_just_pressed("put"):
		b = bullet.instantiate()
		get_parent().add_child(b)
		b.global_position = $Marker2D.global_position
		
		
	
