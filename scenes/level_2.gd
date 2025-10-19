extends Node2D
@onready var empty_beer: CharacterBody2D = $"empty beer"
@onready var client_amount: int = 5


func _ready() -> void:
	Global.clients_alive = 0
	$player.global_position = $tep2.global_position
	

	
func get_input():
	if Input.is_action_just_pressed("up"):
		if $player.global_position.y == $tep3.global_position.y:
			$player.global_position = $tep2.global_position
		elif $player.global_position.y == $tep2.global_position.y:
			$player.global_position = $tep1.global_position
		
	if  Input.is_action_just_pressed("down"):
		if $player.global_position.y == $tep1.global_position.y:
			$player.global_position = $tep2.global_position
		elif $player.global_position.y == $tep2.global_position.y:
			$player.global_position = $tep3.global_position
		
func _physics_process(delta):
	get_input()
	
func _process(delta):
	$clients_to_serve.text = "clients to serve: " + str(Global.clients_alive)
	
	
	
func _on_wall_area_entered(area: Area2D) -> void:
	if area.is_in_group("clients"):
		$glass_break.play()
		Global.break_life(1)
		Global.clients_alive -= 1
	if area.is_in_group("empty drink"):
		$glass_break.play()
		Global.break_life(1)
		

func _on_collect_body_entered(body: Node2D) -> void:
	if body.is_in_group("empty drink"):
		$collect_sound.play()
		Global.add_score(50)  
		body.queue_free()   
	
