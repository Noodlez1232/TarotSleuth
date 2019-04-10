extends Node

var currently_drawn_cards: Array;

var guilty_id: int;

var current_characters: Array;

var lives_remaining: int;
var cards_have_been_drawn: int;

func get_guilty_char() -> Character:
	return current_characters[guilty_id];