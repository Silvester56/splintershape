extends Camera2D

const SCREEN_SIZE = Vector2(960, 960)
var currentScreen = Vector2(0, 0)

func _ready():
	set_as_top_level(true)
	global_position = get_parent().global_position
	updateScreen(currentScreen)

func _physics_process(delta):
	var parentScreen : Vector2 = (get_parent().global_position / SCREEN_SIZE).floor()
	if not parentScreen.is_equal_approx(currentScreen):
		updateScreen(parentScreen)

func updateScreen(newScreen : Vector2):
	currentScreen = newScreen
	global_position = currentScreen * SCREEN_SIZE + SCREEN_SIZE * 0.5
