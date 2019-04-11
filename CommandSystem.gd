extends Node;

const helptext: String = """draw: Draws a new card. Max 3 cards
info: Gets info about the current cards
characters [character's first name]: Gets info about the character. Not giving a name will list the characters
discard: Discards the oldest card
guess [character's first name]: Allows you to guess
help: Shows this message
quit: Quits the game""";

var game_lost: bool = false;

func print_to_textbox(string: String) -> void:
	get_node("../PlayerUI").set_text(string);
	return;

# Processes the command given
func process_command(command: String) -> void:
	# Fix the command
	command = command.to_lower().trim_prefix(' ').trim_suffix(' ');
	var command_words: PoolStringArray = command.split(' ');
	if game_lost:
		process_game_lost(command);
		return;
	# Test which command it is
	match command_words[0]:
		"help":
			print_to_textbox(helptext);
		"guess":
			print(command_words.size());
			if command_words.size() == 1:
				print_to_textbox("I'm not guessing, you are.");
				return;
			elif command_words.size() > 2:
				print_to_textbox("You can't guess more than one person");
				return;
			print(get_node("..").get_guilty_char().name.split(' ')[0].to_lower());
			if command_words[1] == get_node("..").get_guilty_char().name.split(' ')[0].to_lower():
				get_node("..").game_won();
			else:
				print_to_textbox("Nope. That ain't it");
				get_node("..").lose_life();
		"characters":
			if command_words.size() == 1:
				get_node("..").show_characters();
				return;
			elif command_words.size() > 2:
				print_to_textbox("Hey! One at a time!");
				return;
			get_node("..").show_character_info(command_words[1]);
		"draw":
			get_node("../CardSystem").draw_card();
		"discard":
			get_node("../CardSystem").discard_card();
		"info":
			get_node("..").show_card_info();
		"quit":
			get_node("..").exit_game();
		"easteregg":
			print_to_textbox("Here's your crappy easter egg. Now go away. This isn't Ready Player One");
		var bad_command:
			print_to_textbox("What the heck does " + bad_command + " mean?");

func process_game_lost(command):
	# Fix the command
	command = command.to_lower().trim_prefix(' ').trim_suffix(' ');
	match command:
		"yes": continue;
		"y":
			get_node("..").restart_game();
		"no": continue;
		"n": get_node("..").exit_game();