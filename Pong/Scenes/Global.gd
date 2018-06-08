extends Node2D

var scoreLeft
var scoreRight
var finalScore

var screensize

func _ready():
	screensize = get_viewport_rect().size
	scoreLeft = 0
	scoreRight = 0
	finalScore = 5

func ResetScore():
	scoreLeft = 0
	scoreRight = 0
