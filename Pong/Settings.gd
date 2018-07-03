extends CanvasLayer

func _ready():
	$BallV0/TextBallV0.text = str(Global.ballV0)
	$IsBallAccel/ButtonIsBallAccel.pressed = Global.isBallAccel
	
	$Level/LevelMenu.add_item("Easy")
	$Level/LevelMenu.add_item("Medium")
	$Level/LevelMenu.add_item("Hard")
	$Level/LevelMenu.add_item("Invencible")
	$Level/LevelMenu.selected = Global.level
	
	$FinalScore/FinalScoreText.text = str(Global.finalScore)

func _on_Button_button_up():
	get_tree().change_scene(Global.menuScene)

func _on_OkBallV0_button_up():
	Global.ballV0 = $BallV0/TextBallV0.text.to_int()

func _on_CheckButton_toggled(button_pressed):
	Global.isBallAccel = $IsBallAccel/ButtonIsBallAccel.pressed

func _on_LevelMenu_item_selected(ID):
	Global.level = ID

func _on_FinalScoreText_text_changed():
	Global.finalScore = int($FinalScore/FinalScoreText.text)
