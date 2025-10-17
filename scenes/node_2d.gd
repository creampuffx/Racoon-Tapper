extends Node2D

@onready var client_scene = preload("res://scenes/client.tscn")
@onready var doors = [
	$door1,
	$door2,
	$door3
]

func _ready() -> void:
	for i in range(10):
		_on_timer_timeout()


func _on_timer_timeout():
	_spawn()
	
	
func _spawn():
	var door = doors[randi() % doors.size()]
	var cli =  client_scene.instantiate()
	cli.position = door.position
	get_parent().add_child(cli)
	
	 
