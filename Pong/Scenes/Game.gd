extends Node2D

signal score(team)
signal startGame


func _ready():
	$StartPosition1.position.x = 15
	$StartPosition1.position.y = Global.screensize.y/2
	$StartPosition2.position.x = Global.screensize.x - 15
	$StartPosition2.position.y = Global.screensize.y/2
	
	$Bar1.SetPosition($StartPosition1.position)
	$Bar2.SetPosition($StartPosition2.position)

func _process(delta):
	if($Bar1.isAI):
		$Bar1.SetAIPosition(delta, $Ball.position)
	if($Bar2.isAI):
		$Bar2.SetAIPosition(delta, $Ball.position)
	
func _on_LeftLimit_area_entered(area):
	Score("right")

func _on_RightLimit_area_entered(area):
	Score("left")

func Score(team):
	if(team == "left"):
		Global.scoreLeft += 1
	elif(team == "right"):
		Global.scoreRight += 1
	$Ball.ResetPosition()
	$Ball.hide()
	$Start.start()
	$ScoreCheerAudio.play()
	emit_signal("score", team)

func _on_Start_timeout():
	if(not Global.isGameEnded):
		emit_signal("startGame")

func StartTimer():
	$Start.start()
