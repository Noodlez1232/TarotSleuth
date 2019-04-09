extends Node

enum CommandPhase {
	MAIN = 0,
	GUESS = 1,
	CHARACTERS = 2,
	INFO = 3,
	DISCARD = 4,
	DRAW = 5
}

export(Array) var currently_drawn_cards;

export(Resource) var current_character;

export(CommandPhase) var command_phase;

export(int) var lives_remaining;
export(int) var cards_have_been_drawn;



func discard():
	pass;