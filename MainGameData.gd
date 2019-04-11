extends Node
class_name MainGame

var currently_drawn_cards: Array = Array();

var guilty_id: int;

var current_characters: Array;

var lives_remaining: int = 3;
var cards_have_been_drawn: int;


func get_guilty_char() -> Character:
	return current_characters[guilty_id];

func lose_life():
	lives_remaining -= 1;
	if lives_remaining <= 0:
		game_lost();
		return;
	if lives_remaining == 1:
		get_node("PlayerUI").set_text("You've got " + String(lives_remaining) + " try left");
	else:
		get_node("PlayerUI").set_text("You've got " + String(lives_remaining) + " tries left");

func game_lost():
	get_node("PlayerUI").set_text("You've guessed too many times! I guess you'll never know who it was!");
	get_node("PlayerUI").set_text("Do you want to play again?");
	get_node("CommandSystem").game_lost = true;
	
func exit_game():
	get_tree().quit();

func restart_game():
	get_tree().change_scene("res://MainGame.tscn");
	
func show_characters():
	for character in current_characters:
		get_node("PlayerUI").set_text(character.name);
func show_character_info(char_name: String):
	char_name = char_name.to_lower();
	for character in current_characters:
		if char_name == character.name.to_lower().split(' ')[0]:
			get_node("PlayerUI").set_text("Info for " + character.name);
			get_node("PlayerUI").set_text(character.blurb);
			return;
	get_node("PlayerUI").set_text("Who's that?");
	
func show_card_info():
	for card in currently_drawn_cards:
		get_node("PlayerUI").set_text(card.name + ": " + card.info);

func game_won():
	get_node("PlayerUI").set_text("You guessed it! It was " + current_characters[guilty_id].name);
	get_node("PlayerUI").set_text("Would you like to play again?");
	get_node("CommandSystem").game_lost = true;