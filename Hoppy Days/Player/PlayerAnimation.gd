extends AnimatedSprite

#Animation function as given by Rob (https://www.udemy.com/user/rob-van-putten-2/) in lecture 37
func _on_Player_animate(motion):
	if motion.y < 0:
		play("jump")
	elif motion.x != 0:		
		play("walk")		
		set_flip_h(motion.x < 0)
	else:
		play("idle")