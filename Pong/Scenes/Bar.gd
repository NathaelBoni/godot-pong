extends Area2D

signal fromBar

export (Image) var spriteImage
export (bool) var isAI

const SPEED = 300
var screensize

func _ready():
	$Sprite.texture = spriteImage
	screensize = get_viewport_rect().size

func _process(delta):
	if(!isAI):
		Movement(delta)

func SetPosition(pos):
	position = pos

func SetYPosition(pos):
	position.y = pos

func Movement(delta):
	var velocity = Vector2()
	if Input.is_action_pressed("ui_down"):
        velocity.y += 1
	if Input.is_action_pressed("ui_up"):
        velocity.y -= 1
	if velocity.length() > 0:
        velocity = velocity.normalized() * SPEED
	position += velocity * delta
	position.y = clamp(position.y, 0, screensize.y)

func _on_Bar_area_entered(area):
	emit_signal("fromBar")
