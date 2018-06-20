extends CanvasLayer

func _ready():
	pass

func _on_PlayButton_button_up():
	Global.isGameEnded = false
	get_tree().change_scene(Global.gameScene)

func _on_SettingsButton_button_up():
	get_tree().change_scene(Global.settingsScene)

func _on_QuitButton_pressed():
	get_tree().quit()
