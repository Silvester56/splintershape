extends CharacterBody2D

enum EnemyState {
	IDLE,
	PATROL,
	ROTATE,
	SLEEPING
}

@export var currentState = EnemyState.PATROL
@export var directionX = 0
@export var directionY = 0
@export var startingRotation = 0
var currentShape = Shape.RED_SQUARE
var isEnemy = true
const SPEED = 100.0

func _ready() -> void:
	$Vision.rotation = deg_to_rad(startingRotation)

func _physics_process(delta: float) -> void:
	if currentState == EnemyState.PATROL:
		velocity.x = directionX * SPEED
		velocity.y = directionY * SPEED
		if move_and_slide():
			directionX = -directionX
			directionY = -directionY
			$Vision.rotation = $Vision.rotation + deg_to_rad(180)
	elif currentState == EnemyState.ROTATE:
		$Vision.rotation = $Vision.rotation + 0.05
	elif currentState == EnemyState.SLEEPING:
		$Vision.visible = false

func _on_vision_body_entered(body: Node2D) -> void:
	if currentState != EnemyState.SLEEPING and "isPlayer" in body and body.isPlayer and body.currentShape != currentShape:
		$"..".gameover()
