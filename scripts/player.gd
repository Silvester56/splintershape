extends CharacterBody2D

var isPlayer = true
const SPEED = 200.0

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("action"):
		for body in get_node("Range").get_overlapping_bodies():
			if "isEnemy" in body and body.isEnemy:
				print("takedown !")
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
