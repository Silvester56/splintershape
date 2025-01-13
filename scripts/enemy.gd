extends CharacterBody2D

const SPEED = 100.0
var directionX = 1

func _physics_process(delta: float) -> void:
	velocity.x = directionX * SPEED
	if move_and_slide():
		directionX = -directionX
