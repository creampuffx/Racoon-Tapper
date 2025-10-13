extends Node2D

func _ready():
	Global.lives=3
	
func _physics_process(delta):
	if Global.lives == 2:
		$live3.hide()
	elif Global.lives == 1:
		$live2.hide()
	elif Global.lives == 0:
		$live3.hide()
		
	
