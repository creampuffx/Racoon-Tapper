extends Node2D


	
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
	
