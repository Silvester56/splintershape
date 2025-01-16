extends CharacterBody2D

@onready var vision: Node = get_node("Vision")
const SPEED = 100.0
var directionX = 1

func _physics_process(delta: float) -> void:
	velocity.x = directionX * SPEED
	if move_and_slide():
		directionX = -directionX
		vision.rotation = vision.rotation + deg_to_rad(180)
