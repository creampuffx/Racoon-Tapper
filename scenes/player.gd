extends CharacterBody2D

@export var speed = 400
@onready var bullet = preload("res://scenes/beer.tscn")
var b 
const acc = 500

func _psychics_process (delta):
	
	var direction = Input.get_axis("left", "right")
	
	if direction: 
		velocity.x = direction * speed
		$AnimatedSprite2D.play("walk_right")
		
	else: 
		velocity.x = 0
		$AnimatedSprite2D.play("idle")
	
	if direction == 1:
		$AnimatedSprite2D.flip_h = false
	elif direction == -1:
		$AnimatedSprite2D.flip_h = true
		
	move_and_slide()

func _physics_process(delta):
	_psychics_process(delta)
	move_and_slide()
	shoot()
	
func accelerate(direction):
	velocity = velocity.move_toward(speed * direction, acc)

func shoot(): 
	if Input.is_action_just_pressed("put"):
		b = bullet.instantiate()
		get_parent().add_child(b)
		b.global_position = $Marker2D.global_position
