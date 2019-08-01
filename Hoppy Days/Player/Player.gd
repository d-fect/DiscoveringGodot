extends KinematicBody2D

var motion : Vector2 = Vector2(0,0)
var left : int = 0
var right : int = 0
var  lives : int = 3

const SPEED : int = 1000
const GRAVITY = 300
const UP = Vector2(0, -1)					# This tells the game it's a side scroller
const JUMP_SPEED = 4000
const WORLD_BOTTOM = 5000

signal animate

func _physics_process(delta):				# Delta is time in seconds between frames
	apply_gravity()
	jump()
	move()
	animate()
# Movement as given by Samuli, see apply_gravity()-comments
	motion = move_and_slide(motion, UP)


# Gravity calculation as given by Samuli (https://www.udemy.com/user/samuli-7/) in Q/A on lecture 36
# This will fix a "bug" where rabbit won't always jump but feels a little stuck to the ground
func apply_gravity():
	if position.y > WORLD_BOTTOM:
		end_game()
	motion.y += GRAVITY


func jump():
	if Input.is_action_pressed("jump") and is_on_floor():
		motion.y -= JUMP_SPEED


# Movement calculation for left/right  as given by Jesse Wang (https://www.udemy.com/user/jesse-wang-5/) in Q&A on lecture 35
# Idea is if left is pressed, it will have a value of -1 and if right is pressed, it will have a value of +1. 
# If both are pressed, then no movement is made.
func move():
	right = int(Input.is_action_pressed("right"))
	left = -int(Input.is_action_pressed("left"))
	motion.x = (left + right) *  SPEED


#Animation function as given by Rob (https://www.udemy.com/user/rob-van-putten-2/) in lecture 37
func animate():
	emit_signal("animate", motion)


func end_game():
	get_tree().change_scene("res://Levels/GameOver.tscn")


func hurt():
	motion.y -= JUMP_SPEED
	lives -= 1
	if lives < 0:
		end_game()


