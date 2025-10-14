
extends Drink

func _ready():
	super._ready()

func _physics_process(delta: float) -> void:
	global_position.x -= 100 * delta
	



func _on_area_2d_area_entered(area):
	if area.is_in_group("clients"):
		Global.add_score(100)
		queue_free()
	
		
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("left_wall"):
		$Sprite2D.hide()
		$glass_break.play()
		Global.break_life(1)
		await get_tree().create_timer(0.5).timeout 
		queue_free()

		

	
	
