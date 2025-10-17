extends CharacterBody2D
var health = 1
@export var speed = 0
@onready var bullet = preload("res://scenes/empty_beer.tscn")
@onready var empty_beer_position: Marker2D = $empty_beer_position
var direction = -1
@onready var how_much = [1, 1, 2]
@onready var beer_amount = how_much[randi() % how_much.size()]

@onready var client_look = [
	"client1",
	"client2", 
	"client3",
	"client4"]

func _ready() -> void:
	var client_animation = client_look[randi() % client_look.size()]
	$AnimatedSprite2D.play(client_animation)
	$Sprite2D.hide()
	
func _physics_process(delta: float) -> void:
	velocity.x += speed * 1 * delta
	move_and_slide()
	
	
func shoot(): 
		var b = bullet.instantiate()
		get_parent().add_child(b)
		b.global_position = empty_beer_position.global_position
		




func _on_hurt_box_area_entered(area):
	if area.is_in_group("drink-not-empty"):
		handle_drink()
	elif area.is_in_group("walls"):
		queue_free()
		
		
func handle_drink():
	if beer_amount == 1:
		$HurtBox.monitoring = true
		$Sprite2D.show() 
		$drink_sound.play()
		velocity.x = 0
		velocity.x += speed * -1 * 30
		move_and_slide()
		$HurtBox.monitoring = false
		await get_tree().create_timer(3).timeout
		queue_free()
	elif beer_amount == 2:
		$Sprite2D.show() 
		$drink_sound.play()
		velocity.x = 0
		velocity.x += speed * -1 * 30
		move_and_slide()
		$HurtBox.monitoring = false
		await get_tree().create_timer(2).timeout
		shoot()
		$Sprite2D.hide()
		$HurtBox.monitoring = true
		velocity.x += speed * 1 * 30
		move_and_slide()
		beer_amount -= 1
		return
	


	
	
