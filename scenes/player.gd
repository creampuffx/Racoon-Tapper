extends CharacterBody2D

@export var speed = 400
@onready var bullet = preload("res://scenes/beer.tscn")
var b 
const acc = 500
var can_shoot

func _process(float):
	if Input.is_action_just_released("put"):
			if can_shoot == 1:
				$"beer-empty".global_position = $put.global_position
				$beer_2.global_position = $put.global_position
				$beer_2.hide()
	
	
func _psychics_process (delta):
	
	var direction = Input.get_axis("left", "right")
	
	if direction: 
		velocity.x = direction * speed
		
		$"beer-empty".global_position = $right.global_position
		$beer_2.global_position = $right.global_position
		$AnimatedSprite2D.play("run")
		
		
	else: 
		velocity.x = 0
		$AnimatedSprite2D.play("idle_1")
		$"beer-empty".global_position = $oven.global_position
		$beer_2.global_position = $oven.global_position
		
	
	if direction == 1:
		$AnimatedSprite2D.flip_h = true
	elif direction == -1:
		$AnimatedSprite2D.flip_h = false
		$"beer-empty".global_position = $left.global_position
		$beer_2.global_position = $left.global_position
		
	move_and_slide()

func _on_area_2d_body_entered(body: Node2D) -> void:
	can_shoot = 1
	$beer_2.show()
func _on_area_2d_body_exited(body: Node2D) -> void:
	can_shoot = 0
	$beer_2.hide()

func _physics_process(delta):
	_psychics_process(delta)
	move_and_slide()
	shoot()
	
func accelerate(direction):
	velocity = velocity.move_toward(speed * direction, acc)

func shoot(): 
	
	if Input.is_action_just_pressed("put"):
		if can_shoot == 1:
			$beer_2.show()
			b = bullet.instantiate()
			get_parent().add_child(b)
			b.global_position = $Marker2D.global_position
			
			
	 
	
			
		
