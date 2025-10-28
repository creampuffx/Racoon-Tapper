extends Drink


func _ready():
	super._ready()
	$Area2D.monitorable = true
	$AnimatedSprite2D.hide()
	$AnimatedSprite2D.stop()

func _physics_process(delta: float) -> void:
	velocity.x += 30 * delta
	move_and_slide()



func _on_area_2d_area_entered(area):
	if area.is_in_group("walls"):
		$Area2D.monitorable = false
		velocity.x = 0
		velocity.y += 100 
		await get_tree().create_timer(1).timeout
		velocity.y = 0
		velocity.x = 0
		$Sprite2D.hide()
		$AnimatedSprite2D.show()
		$AnimatedSprite2D.play("broken")
		await get_tree().create_timer(1).timeout
		queue_free()
		
		

		
		


	
