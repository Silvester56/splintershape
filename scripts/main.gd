extends Node2D

@onready var pauseMenu = $Player/Camera2D/PauseMenu
@onready var gameOverScreen = $Player/Camera2D/GameOverScreen
@onready var successScreen = $Player/Camera2D/SuccessScreen
var paused = false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		pause()

func pause():
	if paused:
		pauseMenu.hide()
		get_tree().paused = false
	else:
		pauseMenu.show()
		get_tree().paused = true
	paused = !paused

func gameover():
	gameOverScreen.show()
	get_tree().paused = true

func success():
	successScreen.show()
	get_tree().paused = true

func _on_goal_body_entered(body: Node2D) -> void:
	success()
