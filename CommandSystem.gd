extends Node;

# Stubbing an output function
func print_to_textbox(string):
	print("Textbox: " + string);
	pass;
	
func process_command(command):
	# Fix the command
	command = command.to_lower().trim_prefix(' ').trim_suffix(' ');
