extends Node;

var cards: Array = Array();

const CARDS_DIR: String = "res:///Cards/";

func _ready() -> void:
	randomize();
	load_cards();
	for i in range(0, 3):
		draw_card();
	
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
	var char_cards: PoolIntArray = get_character_cards();
	return char_cards[randi() % char_cards.size()];

func draw_card():
	if get_node("..").currently_drawn_cards.size() == 3:
		get_node("../PlayerUI").set_text("That makes it too easy!");
		return;
	var rand_card: Card = cards[get_random_card()];
	while get_node("..").currently_drawn_cards.has(rand_card):
		rand_card = cards[get_random_card()];
	get_node("../PlayerUI").set_text("Got \"" + rand_card.name + "\"");
	get_node("..").currently_drawn_cards.append(rand_card);
	
func discard_card():
	if get_node("..").currently_drawn_cards.size() == 0:
		get_node("../PlayerUI").set_text("Discard what card? There are no cards left!");
		return;
	get_node("../PlayerUI").set_text("Discarded " + get_node("..").currently_drawn_cards.front().name);
	get_node("..").currently_drawn_cards.pop_front();

func get_character_cards() -> PoolIntArray:
	return get_node("..").get_guilty_char().hand;
