extends Area2D

signal coinCollected

func _on_body_entered(body):
	if body.get_name() == "Player":
		body.add_coin()
		queue_free()
		
