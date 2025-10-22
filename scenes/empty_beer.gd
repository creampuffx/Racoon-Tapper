extends Drink


func _ready():
	super._ready()

func _physics_process(delta: float) -> void:
	velocity.x += 30 * delta
	move_and_slide()



func _on_area_2d_area_entered(area):
	if area.is_in_group("walls"):
		velocity.x = 0
		velocity.y += 100 
		await get_tree().create_timer(1).timeout
		queue_free()
		
		

		
		


	
