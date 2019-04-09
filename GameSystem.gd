extends Node
var list = [Barbara, Benjamin, Natasha, William, Clyde]
var Barbara = load("res://Characters/BarbaraB.tres");
var Benjamin = load("res://Characters/BenD.tres");
var Natasha = load("res://Characters/NatashaS.tres");
var William = load("res://Characters/WillY.tres");
var Clyde = load("res://Characters/ClydeS.tres");
func _ready():
#using this to decide who's guilty to start with
	randomize();
	Numb();
	pass
func Numb():
	var x = 0;
	x = randi()%4+0;
	print(x)
	pass