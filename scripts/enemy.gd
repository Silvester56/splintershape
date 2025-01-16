extends CharacterBody2D

enum EnemyState {
	IDLE,
	HORIZONTAL_PATROL,
	VERTICAL_PATROL,
	SLEEPING
}

var isEnemy = true
var currentState = EnemyState.HORIZONTAL_PATROL
@onready var vision: Node = get_node("Vision")
const SPEED = 100.0
var directionX = 1

func _physics_process(delta: float) -> void:
	if currentState == EnemyState.HORIZONTAL_PATROL:
		velocity.x = directionX * SPEED
		if move_and_slide():
			directionX = -directionX
			vision.rotation = vision.rotation + deg_to_rad(180)
	elif currentState == EnemyState.SLEEPING:
		vision.visible = false

func _on_vision_body_entered(body: Node2D) -> void:
	if currentState != EnemyState.SLEEPING and "isPlayer" in body and body.isPlayer:
		print("Game over !")
