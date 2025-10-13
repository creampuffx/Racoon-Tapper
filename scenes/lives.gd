extends Node2D

func _ready():
	Global.lives=3
	
func _physics_process(delta):
	if Global.lives == 2:
		$live3.hide()
	if Global.lives == 1:
		$live2.hide()
	if Global.lives == 0:
		$live1.hide()
		await get_tree().create_timer(1.0).timeout 
		get_tree().change_scene_to_file("res://scenes/game over.tscn")
		
	
