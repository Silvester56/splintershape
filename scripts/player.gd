extends CharacterBody2D

var isPlayer = true
var currentShape = Shape.WHITE_DISK
const SPEED = 250.0

func getSpriteOffset(s):
	if s == Shape.WHITE_DISK:
		return 0
	elif s == Shape.RED_SQUARE:
		return 32
	elif s == Shape.GREEN_TRIANGLE:
		return 64
	elif s == Shape.BLUE_CROSS:
		return 96

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("action"):
		for body in $Range.get_overlapping_bodies():
			if "isEnemy" in body and body.isEnemy:
				if body.currentState == body.EnemyState.SLEEPING:
					$Copy.play()
					currentShape = body.currentShape
					$Shape.region_rect = Rect2(getSpriteOffset(currentShape), 0, 32, 32)
				else:
					$Punch.play()
					body.currentState = body.EnemyState.SLEEPING
	var directionX := Input.get_axis("left", "right")
	if directionX:
		velocity.x = directionX * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	var directionY := Input.get_axis("up", "down")
	if directionY:
		velocity.y = directionY * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	move_and_slide()
