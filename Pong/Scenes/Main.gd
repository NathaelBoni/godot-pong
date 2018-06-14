extends Node2D

func _ready():
	$Pause.hide()
	$Game.StartTimer()

func _on_Game_score(team):
	if(Global.scoreLeft == Global.finalScore || Global.scoreRight == Global.finalScore):
		Global.ResetScore()
		get_tree().change_scene(Global.menuScene)
	$HUD.UpdateScore()
