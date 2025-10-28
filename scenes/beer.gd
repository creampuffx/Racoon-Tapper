
extends Drink
@onready var speed2 = 60
func _ready():
	super._ready()
	$AnimatedSprite2D.hide()
	

func _physics_process(delta: float) -> void:
	velocity.x -= speed2 * delta
	move_and_slide()
	



func _on_area_2d_area_entered(area):
	if area.is_in_group("clients"):
		Global.add_score(100)
		queue_free()
	
		
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("left_wall"):
		$glass_break.play()
		Global.break_life(1)
		await get_tree().create_timer(0.15).timeout
		speed2 = 0 
		velocity.x = 0
		velocity.y = 100
		await get_tree().create_timer(0.8).timeout
		speed2 = 0
		velocity.y = 0
		$Sprite2D.hide()
		$AnimatedSprite2D.show()
		$AnimatedSprite2D.play("broken")
		await get_tree().create_timer(1).timeout
		queue_free()
	
	
