extends Node

var SCORE: int = 0
var clients_alive = 0 
var level = 0

func add_score(points:int):
	SCORE += points
	
	
var lives: int = 3

func break_life(damage:int):
	lives -= damage
	
