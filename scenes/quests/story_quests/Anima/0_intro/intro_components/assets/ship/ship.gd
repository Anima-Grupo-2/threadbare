extends Node2D

@export var amplitude: float = 3.0 
@export var speed: float = 2.0  

var start_y: float
var time_passed: float = 0.0

func _ready():
	start_y = position.y

func _process(delta):
	time_passed += delta
	position.y = start_y + sin(time_passed * speed) * amplitude
