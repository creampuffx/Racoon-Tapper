class_name Drink
extends CharacterBody2D

@export var initial_speed = 240
@export var target_speed = 240
@export var lifespan = 1
@export var acceleration = 0

var speed = initial_speed
var direction = Vector2.RIGHT


func _ready():
	direction = Vector2.RIGHT
	
	await get_tree().create_timer(lifespan).timeout
	await _before_lifespan_expired()	
	queue_free()
	
func _psychics_process(delta):
	speed = lerp(speed, target_speed, acceleration * delta)
	velocity =  speed * delta * direction
	
	var collision = move_and_collide(velocity)
	if collision:
		queue_free()
	
func _before_lifespan_expired():
	pass
	

									
	
