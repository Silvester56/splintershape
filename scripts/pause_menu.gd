extends Control

func _on_resume_pressed() -> void:
	$"../../..".pause()

func _on_to_main_menu_pressed() -> void:
	$"../../..".pause()
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
