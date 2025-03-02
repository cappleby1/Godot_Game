extends CharacterBody2D

const SPEED = 100.0
const JUMP_VELOCITY = -250.0

var player_score = 5

@onready var jump_sound = $JumpSound
@onready var animated_sprite = $AnimatedSprite2D
@onready var score_label = $VBoxContainer/Score

func _ready():
	score_label.text = "Coins Left: " + str(player_score)

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("move_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jump_sound.play()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if direction > 0:
		animated_sprite.flip_h = false
	else:
		animated_sprite.flip_h = true
		

	move_and_slide()
	
func increase_score():
	player_score -= 1
	update_score_display()
	if player_score <= 0:
		on_level_complete()

func update_score_display():
	score_label.text = "Coins Left: " + str(player_score)
	
func on_level_complete():
	call_deferred("move_scene")

func move_scene():
	get_tree().change_scene_to_file("res://scenes/WinScreen.tscn")
