extends Node

var characters: Array = Array();

var guilty_character: int = 0;

const CHARDIR: String = "res:///Characters/";

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

func _ready():
#using this to decide who's guilty to start with
	randomize();
	load_characters();
	numb();
	pass
func numb():
	var x = 0;
	x = randi() % 4 + 0;
	print(x);