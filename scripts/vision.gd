extends Area2D

func _on_body_entered(body: Node2D) -> void:
	if "isPlayer" in body and body.isPlayer:
		print("Game over !")
