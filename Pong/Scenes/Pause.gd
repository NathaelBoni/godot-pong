extends CanvasLayer

var paused = false

func _ready():
	pass
	
func _process(delta):
	if Input.is_action_pressed("ui_escape"):
		print(paused)
		if(paused):
			get_tree().paused = false
			paused = false
			hide()
		else:
			get_tree().paused = true
			paused = true
			hide()
		
