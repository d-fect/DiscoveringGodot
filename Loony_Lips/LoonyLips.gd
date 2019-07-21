extends Control

# Variable declarations
var player_words = []
var story = "Once upon a time someone called %s ate a %s flavoured sandwich which made him feel all %s inside. It was a %s day!"
var prompts = ["a name", "a noun", "an adverb", "an adjective"]

onready var PlayerText  = $VBoxContainer/InputContainer/PlayerText
onready var DisplayText = $VBoxContainer/DisplayText

func _ready():
	$VBoxContainer/InputContainer.visible = true
	$VBoxContainer/RestartContainer.visible = false
	get_node("HeaderText").text = "Your story!"
	DisplayText.text = "Welcome to Loony Lips! With your help, we're going to create a great story together. "
	# TODO: Insert timer here
	check_player_words_length()
	

func _on_PlayerText_text_entered(new_text):
	add_to_player_words()


func _on_TextureButton_pressed():
	add_to_player_words()


func _on_RestartButton_pressed():
	_ready()


func add_to_player_words():
	player_words.append(PlayerText.text)
	DisplayText.text = ""
	PlayerText.clear()
	check_player_words_length()


func is_story_done():
	return player_words.size() == prompts.size()


func check_player_words_length():
	if is_story_done():
		tell_story()
	else:
		prompt_player()


func tell_story():
	$VBoxContainer/InputContainer.visible = false
	$VBoxContainer/RestartContainer.visible = true
	DisplayText.text = story % player_words
	player_words.clear()


func prompt_player():
	DisplayText.text += "\nMay I have " + prompts[player_words.size()] + " please?"




