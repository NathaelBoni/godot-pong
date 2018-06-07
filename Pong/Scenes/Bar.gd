extends Area2D

signal fromBar(barPosition)

export (Image) var spriteImage
export (bool) var isAI

var SPEED
var screensize

func _ready():
	$Sprite.texture = spriteImage
	screensize = get_viewport_rect().size
	if(isAI):
		SPEED = 100
	else:
		SPEED = 300

func _process(delta):
	if(!isAI):
		Movement(delta)

func SetPosition(pos):
	position = pos

func SetAIPosition(delta, BallPos):
	var direction = Vector2()
	if(BallPos.y > position.y):
		direction.y += 1
	else:
		direction.y -= 1
	direction = direction * SPEED
	position += direction * delta
	position.y = clamp(position.y, 0, screensize.y)

func Movement(delta):
	var direction = Vector2()
	if Input.is_action_pressed("ui_down"):
        direction.y += 1
	if Input.is_action_pressed("ui_up"):
        direction.y -= 1
	if direction.length() > 0:
        direction = direction * SPEED
	position += direction * delta
	position.y = clamp(position.y, 0, screensize.y)

func _on_Bar_area_entered(area):
	emit_signal("fromBar", position)
