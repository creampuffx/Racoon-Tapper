extends CharacterBody2D

@export var speed = 400
@onready var bullet = preload("res://scenes/beer.tscn")
var b 

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func _physics_process(delta):
	get_input()
	move_and_slide()
	shoot()
	
	

func shoot(): 
	if Input.is_action_just_pressed("put"):
		b = bullet.instantiate()
		get_parent().add_child(b)
		b.global_position = $Marker2D.global_position
		
		
	
