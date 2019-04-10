extends Node

var cards: Array = Array();

const CARDS_DIR: String = "res:///Cards/";

func _ready() -> void:
	randomize();
	load_cards();
	
func load_cards() -> void:
	# Load all the cards
	var dir: Directory = Directory.new();
	if dir.open(CARDS_DIR) == OK:
		# Skip . and .. and all hidden files
		dir.list_dir_begin(true, true);
		var file_name: String = dir.get_next();
		while file_name != "":
			var card: Card = load(CARDS_DIR + file_name);
			if card.id >= cards.size():
				cards.resize(card.id + 1);
			cards[card.id] = card;
			file_name = dir.get_next()
	else:
		printerr("Could not open the cards directory!");
		get_tree().quit();

# Returns an index to the cards array
func get_random_card() -> int:
	var char_cards = get_character_cards();
	return char_cards[randi() % char_cards]
	
func get_character_cards() -> PoolIntArray:
	return get_tree().root.get_node("GameRoot").get_guilty_char().hand;
	
# Returns a boolean on whether it succeeds or fails
func discard_card(cardno: int):
	var drawn_cards = get_tree().root.get_node("GameRoot").currently_drawn_cards();
	