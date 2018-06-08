extends Node2D

func _ready():
	$Game.StartTimer()

func _on_Game_score(team):
	if(Global.scoreLeft == Global.finalScore || Global.scoreRight == Global.finalScore):
		Global.ResetScore()
	$HUD.UpdateScore()
