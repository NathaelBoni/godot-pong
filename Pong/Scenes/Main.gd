extends Node2D

var winFxScene

func _ready():
	$Pause.hide()
	$Game.StartTimer()
	Global.scoreLeft = 0
	Global.scoreRight = 0
	
	winFxScene = load("res://Scenes/WinEffect.tscn")

func _on_Game_score(team):
	if(Global.scoreLeft == Global.finalScore || Global.scoreRight == Global.finalScore):
		if(Global.scoreLeft > Global.scoreRight):
			$EndResult.text = "Left wins!"
		else:
			$EndResult.text = "Right wins!"
		$MatchCheerAudio.play()
		Fireworks()
		$EndTimer.start()
		Global.isGameEnded = true
	$HUD.UpdateScore()

func Fireworks():
	$WinEffect1.restart()
	$WinEffect2.restart()

func _on_EndTimer_timeout():
	get_tree().change_scene(Global.menuScene)
	Global.ResetScore()
