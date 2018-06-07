extends Area2D

signal score(team)

var blueBall = load("res://Images/ball_blue.png")
var redBall = load("res://Images/ball_red.png")

var SPEED
var screensize
var direction = Vector2()

func _ready():
	screensize = get_viewport_rect().size
	SPEED = 300
	position.x = screensize.x/2
	position.y = screensize.y/2
	direction.x = -1
	direction.y = 1
	
func _process(delta):
	direction = direction.normalized() * SPEED
	position += direction * delta
	position.y = clamp(position.y, 0, screensize.y)

func SetTexture(param):
	$Sprite.texture = param

func _on_UpperLimit_area_entered(area):
	direction.y = -direction.y

func _on_LowerLimit_area_entered(area):
	direction.y = -direction.y

func _on_LeftLimit_area_entered(area):
	emit_signal("score", 2)

func _on_RightLimit_area_entered(area):
	emit_signal("score", 1)

func _on_Bar1_fromBar(barPosition):
	direction = position-barPosition
	if(SPEED < 500):
		SPEED += 10
	SetTexture(blueBall)

func _on_Bar2_fromBar(barPosition):
	direction = position-barPosition
	if(SPEED < 500):
		SPEED += 10
	SetTexture(redBall)
