extends Area2D



func _on_body_entered(body):
	print(body.get_name())
	if body.get_name() == "Player":
		print("reloading scene...")
		GLOBAL.coins = 0
		get_tree().reload_current_scene()
