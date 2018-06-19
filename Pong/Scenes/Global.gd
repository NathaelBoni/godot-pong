extends Node2D

var scoreLeft
var scoreRight
var finalScore

var screensize

var gameScene = "res://Scenes/Main.tscn"
var settingsScene = "res://Scenes/Settings.tscn"
var menuScene = "res://Scenes/Menu.tscn"

#settings
var ballV0 = 300
var isBallAccel = true

func _ready():
	screensize = get_viewport_rect().size
	scoreLeft = 0
	scoreRight = 0
	finalScore = 2

func ResetScore():
	scoreLeft = 0
	scoreRight = 0
