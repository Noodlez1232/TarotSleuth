extends Node
var Barbara: Character = load("res://Characters/BarbaraB.tres");
var Benjamin: Character = load("res://Characters/BenD.tres");
var Natasha: Character = load("res://Characters/NatashaS.tres");
var William: Character = load("res://Characters/WillY.tres");
var Clyde: Character = load("res://Characters/ClydeS.tres");
var list = [Barbara, Benjamin, Natasha, William, Clyde];
var characters: Array = Array();

var guilty_character: int = 0;

const CHARDIR: String = "res:///Characters/";

	

func _ready():
#using this to decide who's guilty to start with
	randomize();
	numb();
	pass
func numb():
	var x = 0;
	x = randi() % 4 + 0;
	print(x);