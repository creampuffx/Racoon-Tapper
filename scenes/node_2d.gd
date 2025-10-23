extends Node2D

@onready var client_scene = preload("res://scenes/client.tscn")
@onready var doors = [
	$door1,
	$door2,
	$door3
]
		
		
func _ready():
	_spawn(Global.spawn * 5)
	
	
func _spawn(amount):
	for i in range (amount):
		print (i)
		var door = doors[randi() % doors.size()]
		var cli =  client_scene.instantiate()
		cli.position = door.position
		get_parent().add_child(cli)
		Global.clients_alive += 1
		await get_tree().create_timer(1).timeout
	
	
	
	 
 
