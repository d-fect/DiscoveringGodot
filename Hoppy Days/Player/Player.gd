extends KinematicBody2D

var motion : Vector2 = Vector2(0,0)
var left : int = 0
var right : int = 0

const SPEED : int = 1000
const GRAVITY = 300
const UP = Vector2(0, -1)
const JUMP_SPEED = 3000

func _physics_process(delta):				# Delta is time in seconds between frames
	apply_gravity()
	jump()
	move()
# Movement as given in course
#	move_and_slide(motion, UP)
# Movement as given by Samuli, see apply_gravity()-comments
	motion = move_and_slide(motion, UP)


# Gravity calculation as given by Samuli (https://www.udemy.com/user/samuli-7/) in Q/A on lecture 36
# This will fix a "bug" where rabbit won't always jump but feels a little stuck to the ground
func apply_gravity():
# Gravity-calculations as given by course
#	if is_on_floor():
#		motion.y = 0 
#	else:
#		motion.y += GRAVITY
	motion.y += GRAVITY


func jump():
	if Input.is_action_just_pressed("jump") and is_on_floor():
		motion.y -= JUMP_SPEED


# Movement calculation for left/right  as given by Jesse Wang (https://www.udemy.com/user/jesse-wang-5/) in Q&A on lecture 35
# Idea is if left is pressed, it will have a value of -1 and if right is pressed, it will have a value of +1. 
# If both are pressed, then no movement is made.
func move():
#	Movement function as given in course
#	if Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
#		motion.x = -SPEED
#	elif Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
#		motion.x = SPEED
#	else:
#		motion.x = 0
	right = int(Input.is_action_pressed("right"))
	left = -int(Input.is_action_pressed("left"))
	motion.x = (left + right) *  SPEED