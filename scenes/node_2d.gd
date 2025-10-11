extends Node2D

@onready var client_scene = preload("res://scenes/client.tscn")
@onready var doors = [
	$door1,
	$door2,
	$door3
]

func _on_timer_timeout() -> void:
	var door = doors[randi() %doors.size()]
	var cli =  client_scene.instantiate()
	cli.position = door.position
	get_parent().add_child(cli)
	
	
	
