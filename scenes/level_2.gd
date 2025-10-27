extends Node2D
@onready var empty_beer: CharacterBody2D = $"empty beer"
@onready var client_amount: int = 5
@onready var row = 2
var level = 2


func _ready() -> void:
	Global.clients_alive = 1
	$player.global_position = $tep2.global_position
	$Panel.show()
	await get_tree().create_timer(6).timeout
	$Panel.hide()
	%player2.hide()
	
	

func get_input():
	if Input.is_action_just_pressed("up"):
		$player2.position.y = $player.position.y
		$player2.position.x = $player.position.x + 180
		
		if row == 1:
			$player.global_position = $tep1.global_position
		if row == 2:
			$player.global_position = $tep1.global_position
		if row == 3:
			$player.global_position = $tep2.global_position
		$player2.show()
		$player2/AnimatedSprite2D.play("tep")
		await get_tree().create_timer(0.4).timeout
		$player2/AnimatedSprite2D.stop()
		$player2.hide()
		
	if  Input.is_action_just_pressed("down"):
		$player2.position.y = $player.position.y
		$player2.position.x = $player.position.x + 180
		$player2.show()
		$player2/AnimatedSprite2D.play("tep")
		if row == 1:
			$player.global_position = $tep2.global_position
		if row == 2:
			$player.global_position = $tep3.global_position
		if row == 3:
			$player.global_position = $tep3.global_position
		$player2.show()
		$player2/AnimatedSprite2D.play("tep")
		await get_tree().create_timer(0.4).timeout
		$player2/AnimatedSprite2D.stop()
		$player2.hide()
		
func _physics_process(delta):
	get_input()
	
func _process(delta):
	$clients_to_serve.text = "x" + str(Global.clients_alive)
	await get_tree().create_timer(6).timeout
	if Global.clients_alive == 0:
		await get_tree().create_timer(2).timeout
		_plus_level()
	
	
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
		
		
func _on_tp_1_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		row = 1


func _on_tp_2_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		row = 2


func _on_tp_3_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		row = 3
		
		
func _plus_level():
	Global.level += 1
	Global.spawn += 1
	Global.speed += 10
	$Panel.show()
	get_tree().change_scene_to_file("res://scenes/level_2.tscn")
	

	
	
