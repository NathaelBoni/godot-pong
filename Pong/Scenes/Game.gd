extends Node2D

var screensize

func _ready():
	screensize = get_viewport_rect().size
	$StartPosition1.position.x = 15
	$StartPosition1.position.y = screensize.y/2
	$StartPosition2.position.x = screensize.x - 15
	$StartPosition2.position.y = screensize.y/2
	
	$Bar1.SetPosition($StartPosition1.position)
	$Bar2.SetPosition($StartPosition2.position)
	
	#$Ball.position = $Bar1.position
	$Ball.SetTexture(load("res://Images/ball_red.png"))

func _process(delta):
	if($Bar1.isAI):
		$Bar1.SetYPosition($Ball.position.y)
	if($Bar2.isAI):
		$Bar2.SetYPosition($Ball.position.y)

func positionIA(pos):
	pass

func _on_LeftLimit_area_entered(area):
	#Red goal
	pass # replace with function body

func _on_RightLimit_area_entered(area):
	#Blue goal
	pass # replace with function body
