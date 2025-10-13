extends Node2D
@onready var empty_beer: CharacterBody2D = $"empty beer"


func _ready() -> void:
	Global.SCORE = 0
	

	
func get_input():
	if Input.is_action_just_pressed("up"):
		if $player.global_position.y == $tep3.global_position.y:
			$player.global_position = $tep2.global_position
		else: $player.global_position = $tep1.global_position
		
		
	if  Input.is_action_just_pressed("down"):
		if $player.global_position.y == $tep1.global_position.y:
			$player.global_position = $tep2.global_position
		else: $player.global_position = $tep3.global_position
		
		
		



func _physics_process(delta):
	get_input()
	


func _on_wall_area_entered(area: Area2D) -> void:
	if area.is_in_group("clients"):
		$glass_break.play()
		Global.break_life(1)
	
