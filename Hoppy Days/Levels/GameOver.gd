extends Control

# TODO: 
# Create a slowly scrolling parallax background

func _ready():
	$CenterContainer/VBoxContainer/HBoxContainer/RestartButton.grab_focus()


func _on_RestartButton_pressed():
	get_tree().change_scene("res://Levels/Level1.tscn")