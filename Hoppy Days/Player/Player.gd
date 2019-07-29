extends KinematicBody2D

var motion : Vector2 = Vector2(0,0)
var left : int = 0
var right : int = 0

const SPEED : int = 1000

func _physics_process(delta):				# Delta is time in seconds between frames
#	Movement function as given in course
#	if Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
#		motion.x = -SPEED
#	elif Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
#		motion.x = SPEED
#	else:
#		motion.x = 0

# Movement calculation as given by Jesse in Q&A on the lecture
	left = -int(Input.is_action_pressed("left"))
	right = int(Input.is_action_pressed("right"))
	motion.x = (left + right) *  SPEED
	move_and_slide(motion)
	
