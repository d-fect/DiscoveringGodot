extends Control

func _ready():
	var songPrompts = ["OGG", "MC Solaar", "Nouveau Western", "liked it"]
	var songStory = "%s listened to the %s song %s, and he %s!"
	print(songStory % songPrompts)
	
	get_node("HeaderText").text = "Welcome!"
	# $DisplayText.text = "This is some text!"		# $NodeName is the same as using get_node("NodeName)
	$DisplayText.text = (songStory % songPrompts)