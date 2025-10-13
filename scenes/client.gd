extends CharacterBody2D
var health = 1
@export var speed = 0

	
func _physics_process(delta: float) -> void:
	velocity.x += speed * delta
	move_and_slide()


func _on_hurt_box_area_entered(area: Area2D) -> void:
	queue_free()



	
	
