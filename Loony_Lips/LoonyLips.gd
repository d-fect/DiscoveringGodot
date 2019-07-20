extends Control

func _ready():
	var songPrompts = ["OGG", "MC Solaar", "Nouveau Western", "liked it"]
	var songStory = "%s listened to the %s song %s, and he %s!"
#	print(songStory % songPrompts)
	
	get_node("HeaderText").text = "Your story!"
#	$DisplayText.text = "This is some text!"		# $NodeName is the same as using get_node("NodeName)
	$VBoxContainer/DisplayText.text = (songStory % songPrompts)
	

func _on_PlayerText_text_entered(new_text):
	update_DisplayText(new_text)


func _on_TextureButton_pressed():
	var new_text = $VBoxContainer/HBoxContainer/PlayerText.text
	update_DisplayText(new_text)


func update_DisplayText(words):
	$VBoxContainer/DisplayText.text = words
	$VBoxContainer/HBoxContainer/PlayerText.clear()