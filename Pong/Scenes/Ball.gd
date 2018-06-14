extends Area2D

var blueBall = load("res://Images/ball_blue.png")
var redBall = load("res://Images/ball_red.png")

var SPEED
var direction

func _ready():
	SPEED = 0
	ResetPosition()
	direction = Vector2()
	hide()
	
func _process(delta):
	direction = direction.normalized() * SPEED
	position += direction * delta
	position.y = clamp(position.y, 0, Global.screensize.y)

func SetTexture(param):
	$Sprite.texture = param

func _on_UpperLimit_area_entered(area):
	direction.y = -direction.y

func _on_LowerLimit_area_entered(area):
	direction.y = -direction.y

func _on_Bar1_fromBar(barPosition):
	hitBack(barPosition, blueBall)

func _on_Bar2_fromBar(barPosition):
	hitBack(barPosition, redBall)
	
func hitBack(barPosition, texture):
	direction = position-barPosition
	if(SPEED < 600 && Global.isBallAccel):
		SPEED += 10
	SetTexture(texture)

func _on_Game_startGame():
	SPEED = Global.ballV0
	ResetPosition()
	direction.x = -1
	direction.y = 0
	show()

func ResetPosition():
	position.x = Global.screensize.x/2
	position.y = Global.screensize.y/2
	direction = Vector2()
	
