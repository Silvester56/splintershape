extends CharacterBody2D

var currentShape = Shape.RED_SQUARE

enum EnemyState {
	IDLE,
	HORIZONTAL_PATROL,
	VERTICAL_PATROL,
	SLEEPING
}

var isEnemy = true
var currentState = EnemyState.HORIZONTAL_PATROL
const SPEED = 100.0
var directionX = 1

func _physics_process(delta: float) -> void:
	if currentState == EnemyState.HORIZONTAL_PATROL:
		velocity.x = directionX * SPEED
		if move_and_slide():
			directionX = -directionX
			$Vision.rotation = $Vision.rotation + deg_to_rad(180)
	elif currentState == EnemyState.SLEEPING:
		$Vision.visible = false

func _on_vision_body_entered(body: Node2D) -> void:
	if currentState != EnemyState.SLEEPING and "isPlayer" in body and body.isPlayer and body.currentShape != currentShape:
		print("Game over !")
