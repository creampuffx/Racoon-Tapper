extends Drink

func _ready():
	super._ready()

func _physics_process(delta: float) -> void:
	global_position.x += 100 * delta



func _on_area_2d_area_entered(area):
	if area.is_in_group("walls"):
		queue_free()
	if area.is_in_group("player"):
		Global.add_score(50)
		print ("colected")
		queue_free()
		


	
