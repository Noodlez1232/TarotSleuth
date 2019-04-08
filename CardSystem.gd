extends Node

func _ready():
	randomize();
	discard_card(0);

func draw_card():
	var cards = get_character_cards();
	return cards[randi() % cards.length];
	
func get_character_cards():
	return [0,1,2,3,4];
	
func discard_card(cardno):
	pass;