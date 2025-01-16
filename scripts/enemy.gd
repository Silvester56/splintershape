extends CharacterBody2D

var isEnemy = true
@onready var vision: Node = get_node("Vision")
const SPEED = 100.0
var directionX = 1

func _physics_process(delta: float) -> void:
	velocity.x = directionX * SPEED
	if move_and_slide():
		directionX = -directionX
		vision.rotation = vision.rotation + deg_to_rad(180)

func _on_vision_body_entered(body: Node2D) -> void:
	if "isPlayer" in body and body.isPlayer:
		print("Game over !")
