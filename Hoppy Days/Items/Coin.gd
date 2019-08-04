extends Node2D

var taken : bool = false

func _ready():
	$AnimatedSprite.playing = true

func _on_Area2D_body_entered(body):
	if not taken:
		taken = true
		$AnimationPlayer.play("die")
		$AudioStreamPlayer.play()
		get_tree().call_group("Gamestate", "coin_up")


func die():
	queue_free()