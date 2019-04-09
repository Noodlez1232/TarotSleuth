extends Node

var cards = Array();

export(String) var cardsDir = "res:///Cards/";

func _ready():
	randomize();
	load_cards();
	
func load_cards():
	# Load all the cards
	var dir = Directory.new();
	if dir.open(cardsDir) == OK:
		# Skip . and .. and all hidden files
		dir.list_dir_begin(true, true);
		var fileName = dir.get_next();
		while fileName != "":
			var card = load(cardsDir + fileName);
			if card.id >= cards.size():
				cards.resize(card.id + 1);
			cards[card.id] = card;
			fileName = dir.get_next()
	else:
		printerr("Could not open the cards directory!");
		get_tree().quit();

# Returns the card object
func get_random_card():
	var char_cards = get_character_cards();
	return cards[char_cards[randi() % char_cards]]
	
func get_character_cards():
	return [0,1,2,3,4];
	
# Returns a boolean on whether it succeeds or fails
func discard_card(cardno):
	var drawn_cards = get_tree().root.get_child("GameRoot").currently_drawn_cards();
	