extends CanvasLayer

func _ready():
	pass

func UpdateScore():
	$LeftScore.text = str(Global.scoreLeft)
	$RightScore.text = str(Global.scoreRight)
