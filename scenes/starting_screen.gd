
extends Control
@onready var main_buttons: VBoxContainer = $Main_buttons
@onready var options: Panel = $Options

func _ready():
	main_buttons.visible = true
	options.visible = false
	
 
func _on_start_pressed():
	get_tree().change_scene_to_file("res://scenes/instructions.tscn")


func _on_exit_pressed():
	get_tree().quit()
	


func _on_options_pressed():
	options.visible = true
	main_buttons.visible = false
	
func _on_back_pressed():
	_ready()
	
