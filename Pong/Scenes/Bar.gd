extends Area2D

signal fromBar(barPosition)

export (Image) var spriteImage

var SPEED
var invincible
var isAI
var player

func _ready():
	player = 1
	isAI = false
	$Sprite.texture = spriteImage
	invincible = false
	if(isAI):
		match Global.level:
			0:
				SPEED = 50
			1:
				SPEED = 150
			2:
				SPEED = 300
			3:
				invincible = true
	else:
		SPEED = 300

func _process(delta):
	if(!isAI):
		Movement(delta)

func SetPlayer(p):
	if(p == 0):
		isAI = true
	else:
		player = p

func SetPosition(pos):
	position = pos

func SetAIPosition(delta, BallPos):
	var direction = Vector2()
	if(invincible):
		position.y = BallPos.y
	else:
		if(BallPos.y > position.y):
			direction.y += 1
		else:
			direction.y -= 1
		direction = direction * SPEED
		position += direction * delta
		position.y = clamp(position.y, 0, Global.screensize.y)

func Movement(delta):
	var direction = Vector2()
	if(player == 1):
		if Input.is_action_pressed("ui_down"):
	        direction.y += 1
		if Input.is_action_pressed("ui_up"):
	        direction.y -= 1
	if(player == 2):
		if Input.is_action_pressed("ui_down2"):
	        direction.y += 1
		if Input.is_action_pressed("ui_up2"):
	        direction.y -= 1
	if direction.length() > 0:
        direction = direction * SPEED
	position += direction * delta
	position.y = clamp(position.y, 0, Global.screensize.y)

func _on_Bar_area_entered(area):
	emit_signal("fromBar", position)

