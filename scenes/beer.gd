
extends Drink

func _ready():
	super._ready()

func _physics_process(delta: float) -> void:
	global_position.x -= 100 * delta
	


func _on_area_2d_area_entered(area: Area2D) -> void:
	Global.add_score(100)
	queue_free()
	
	
