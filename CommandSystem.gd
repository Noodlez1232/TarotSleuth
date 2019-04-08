extends Node;

# Fix the command
func fix_command(command):
	return command.to_lower().trim_prefix(' ').trim_suffix(' ');
