extends Control

var paused = false

func _ready():
	pass
	
func _input(event):
	if event.is_action_pressed("ui_escape"):
		if(paused):
			get_tree().paused = false
			paused = false
			hide()
		else:
			get_tree().paused = true
			paused = true
			show()

func _on_Button_button_up():
	get_tree().paused = false
	get_tree().change_scene(Global.menuScene)
