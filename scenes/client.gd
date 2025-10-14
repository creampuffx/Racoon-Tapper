extends CharacterBody2D
var health = 1
@export var speed = 0
@onready var bullet = preload("res://scenes/empty_beer.tscn")
@onready var empty_beer_position: Marker2D = $empty_beer_position


	
func _physics_process(delta: float) -> void:
	velocity.x += speed * 1 * delta
	move_and_slide()
	
	
func shoot(): 
		var b = bullet.instantiate()
		get_parent().add_child(b)
		b.global_position = empty_beer_position.global_position


func _on_hurt_box_area_entered(area):
	if area.is_in_group("drink-not-empty"):
		shoot()
		queue_free()
	if area.is_in_group("walls"):
		queue_free()
		
	



	
	
