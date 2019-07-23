extends Control

# Variable declarations
var player_words = []
var current_story = {}

onready var PlayerText  = $VBoxContainer/InputContainer/PlayerText
onready var DisplayText = $VBoxContainer/DisplayText

func _ready():
	get_node("HeaderText").text = "Your story!"
	DisplayText.text = "Welcome to Loony Lips! With your help, we're going to create a great story together. "
	# TODO: Insert timer here. Or not...
	set_current_story()
	check_player_words_length()


func set_current_story():
	var stories = get_from_json("StoryBook.json")
	randomize()
	current_story = stories[randi() % stories.size()]


func get_from_json(filename):
	var file = File.new()
	file.open(filename, File.READ)
	var text = file.get_as_text()
	var data = parse_json(text)
	file.close()
	return data


func _on_PlayerText_text_entered(new_text):
	add_to_player_words()


func _on_TextureButton_pressed():
	if is_story_done():
		get_tree().reload_current_scene()
	else:
		add_to_player_words()


func add_to_player_words():
	player_words.append(PlayerText.text)
	DisplayText.text = ""
	PlayerText.clear()
	check_player_words_length()


func is_story_done():
	return player_words.size() == current_story.prompts.size()


func check_player_words_length():
	if is_story_done():
		end_game()
	else:
		prompt_player()


func tell_story():
	DisplayText.text = current_story.story % player_words


func prompt_player():
	PlayerText.grab_focus()
	DisplayText.text += "\nMay I have " + current_story.prompts[player_words.size()] + " please?"


func end_game():
	PlayerText.queue_free()
	$VBoxContainer/InputContainer/Label.text = "Play again?"
	$VBoxContainer/InputContainer/TextureButton.grab_focus()
	tell_story()

