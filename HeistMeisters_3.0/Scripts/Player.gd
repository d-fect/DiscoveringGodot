extends "res://Scripts/Character.gd"

var motion : Vector2 = Vector2(0,0)
var left : int = 0
var right : int = 0
var up : int = 0
var down : int = 0


func _process(delta):
	update_motion(delta)
	move_and_slide(motion)


func update_motion(delta):
	look_at(get_viewport().get_mouse_position())
	
	right = int(Input.is_action_pressed("ui_right"))
	left = -int(Input.is_action_pressed("ui_left"))
	up =  -int(Input.is_action_pressed("ui_up"))
	down = int(Input.is_action_pressed("ui_down"))
	if (left+right) != 0:
		motion.x = clamp((left + right) *  SPEED, -MAX_SPEED, MAX_SPEED)
	else:
		motion.x = lerp(motion.x, 0 , FRICTION)
	if (up+down) != 0:
		motion.y = clamp((up + down) *  SPEED, -MAX_SPEED, MAX_SPEED)
	else: 
		motion.y = lerp(motion.y, 0 , FRICTION)