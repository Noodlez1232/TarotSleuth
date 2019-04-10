extends Node

var characters: Array = Array();

var guilty_character: int = 0;

const CHARDIR: String = "res:///Characters/";

func _ready():
	randomize();
	load_characters();
	pick_random_characters();
	# Picks the guilty character
	numb();
	
func load_characters() -> void:
	# Load all the characters
	var dir: Directory = Directory.new();
	if dir.open(CHARDIR) == OK:
		# Skip . and .. and all hidden files
		dir.list_dir_begin(true, true);
		var file_name: String = dir.get_next();
		while file_name != "":
			var character: Character = load(CHARDIR + file_name);
			if character.id >= characters.size():
				characters.resize(character.id + 1);
			characters[character.id] = character;
			file_name = dir.get_next()
	else:
		printerr("Could not open the cards directory!");
		get_tree().quit();

func pick_random_characters():
	# There's a better way to do this, but this is what I'm doing now because it's what I thought of
	var ids: Array = range(0, characters.size());
	ids.shuffle();
	ids.resize(4);
	# Pull the characters into the main data array
	get_tree().root.get_node("GameRoot").current_characters = Array();
	for id in ids:
		get_tree().root.get_node("GameRoot").current_characters.append(characters[id]);
# Picks the guilty character
func numb():
	var guilty_id = randi() % 4;
	get_tree().root.get_node("GameRoot").guilty_id = guilty_id;