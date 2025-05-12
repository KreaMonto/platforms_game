extends Node


var coins : int = 0

var axis : Vector2
func get_movement() -> Vector2:
	axis.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	axis.y = int(Input.is_action_pressed("ui_up")) - int(Input.is_action_just_pressed("ui_down"))
	return axis.normalized()
