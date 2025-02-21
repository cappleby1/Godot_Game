extends CharacterBody2D

const GRAVITY = 300.0
const WALK_SPEED = 300.0
const JUMP_SPEED = 200.0

func _physics_process(delta):
	velocity.y += delta * GRAVITY

	if Input.is_action_pressed("move_left"):
		velocity.x =- WALK_SPEED
	elif Input.is_action_pressed("move_right"):
		velocity.x =+ WALK_SPEED
	elif Input.is_action_pressed("move_up") and is_on_floor():
		velocity.y =- JUMP_SPEED
	else:
		velocity.x = 0

	move_and_slide()
