extends Node2D

var  lives : int = 3
var coins : int = 0
var coin_target : int = 10

func _ready():
	# OS.window_fullscreen = true
	add_to_group("Gamestate")
	update_GUI()


func coin_up():
	coins += 1
	update_GUI()
	var multiple_of_coins = ((coins % coin_target) == 0)	# This is a BOOLEAN value. Will be true for every multiple of coin_target
	if multiple_of_coins:
		life_up()


func life_up():
	lives += 1
	update_GUI()


func hurt():
	lives -= 1
	$Player.hurt()
	update_GUI()
	if lives < 0:
		end_game()


func update_GUI():
	get_tree().call_group("GUI", "update_GUI", lives, coins)


func end_game():
	get_tree().change_scene("res://Levels/GameOver.tscn")


func win_game():
	get_tree().change_scene("res://Levels/Victory.tscn")