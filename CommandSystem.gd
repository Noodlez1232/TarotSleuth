extends Node;

const helptext: String = """draw: Draws a new card. Max 3 cards
info: Gets info about the current cards
characters [character's first name]: Gets info about the character. Not giving a name will list the characters
discard: Discards the oldest card
guess [character's first name]: Allows you to guess
help: Shows this message""";

# Stubbing an output function
func print_to_textbox(string: String) -> void:
	get_tree().root.get_node("GameRoot/PlayerUI").set_text(string);
	return;

# Processes the command given
func process_command(command: String) -> void:
	# Fix the command
	command = command.to_lower().trim_prefix(' ').trim_suffix(' ');
	var command_words: PoolStringArray = command.split(' ');
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
			# TODO: Finish off this command