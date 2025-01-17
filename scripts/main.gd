extends Node2D

@onready var pauseMenu = $PauseMenu
@onready var gameOverScreen = $GameOverScreen
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
