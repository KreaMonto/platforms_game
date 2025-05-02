extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -400.0

@onready var sprite = $Sprite2D
@onready var animationLayer = $AnimationPlayer

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	
	var friction = false
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		if friction == true:
			velocity.x = lerp(velocity.x, 0, 0.5)

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		animationLayer.play("jump")

	# handle direction
	velocity.x = GLOBAL.get_movement().x * SPEED
	if velocity.x > 0:
		animationLayer.play("walk")
		sprite.flip_h = true
	elif velocity.x < 0:
		animationLayer.play("walk")
		sprite.flip_h = false
	else:
		animationLayer.play("idle")
		friction = true

	move_and_slide()
