extends CanvasLayer

func _ready():
	pass

func _on_1PButton_button_up():
	Global.isGameEnded = false
	Global.isTwoP = false
	get_tree().change_scene(Global.gameScene)

func _on_2PButton_button_up():
	Global.isGameEnded = false
	Global.isTwoP = true
	get_tree().change_scene(Global.gameScene)
	
func _on_SettingsButton_button_up():
	get_tree().change_scene(Global.settingsScene)

func _on_QuitButton_pressed():
	get_tree().quit()
