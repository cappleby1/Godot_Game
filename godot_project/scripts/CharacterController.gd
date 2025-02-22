extends CharacterBody2D

const GRAVITY = 300.0
const WALK_SPEED = 300.0
const JUMP_SPEED = 200.0
@onready var JumpSound = $JumpSound

# Movement - left/right/jump
func _physics_process(delta):
	velocity.y += delta * GRAVITY

	# Walk
	if Input.is_action_pressed("move_left"):
		velocity.x =- WALK_SPEED
	elif Input.is_action_pressed("move_right"):
		velocity.x =+ WALK_SPEED
	else:
		velocity.x = 0
		
	# Jump
	if Input.is_action_pressed("move_up") and is_on_floor():
		velocity.y =- JUMP_SPEED
		JumpSound.play()

	move_and_slide()


func _on_kill_zone_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	get_tree().reload_current_scene()
