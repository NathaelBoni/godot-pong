extends CanvasLayer

func _ready():
	$BallV0/TextBallV0.text = str(Global.ballV0)
	$IsBallAccel/ButtonIsBallAccel.pressed = Global.isBallAccel

func _on_Button_button_up():
	get_tree().change_scene(Global.menuScene)

func _on_OkBallV0_button_up():
	Global.ballV0 = $BallV0/TextBallV0.text.to_int()

func _on_CheckButton_toggled(button_pressed):
	Global.isBallAccel = $IsBallAccel/ButtonIsBallAccel.pressed
