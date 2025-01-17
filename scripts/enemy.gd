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
@export var shapeNumber = 1

var currentShape = Shape.RED_SQUARE
var isEnemy = true
const SPEED = 100.0

func getCurrentShape(n):
	if n == 0:
		return Shape.WHITE_DISK
	elif n == 1:
		return Shape.RED_SQUARE
	elif n == 2:
		return Shape.GREEN_TRIANGLE
	elif n == 3:
		return Shape.BLUE_CROSS

func getSpriteOffset(s):
	if s == Shape.WHITE_DISK:
		return 0
	elif s == Shape.RED_SQUARE:
		return 32
	elif s == Shape.GREEN_TRIANGLE:
		return 64
	elif s == Shape.BLUE_CROSS:
		return 96

func getVisionColor(s):
	if s == Shape.WHITE_DISK:
		return Color(1, 1, 1, 0.5)
	elif s == Shape.RED_SQUARE:
		return Color(1, 0, 0, 0.5)
	elif s == Shape.GREEN_TRIANGLE:
		return Color(0, 1, 0, 0.5)
	elif s == Shape.BLUE_CROSS:
		return Color(0, 0, 1, 0.5)

func _ready() -> void:
	currentShape = getCurrentShape(shapeNumber)
	$Shape.region_rect = Rect2(getSpriteOffset(currentShape), 0, 32, 32)
	$Vision/Polygon2D.color = getVisionColor(currentShape)

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
