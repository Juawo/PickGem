extends CharacterBody2D


const SPEED = 220.0
const JUMP_VELOCITY = -280.0
var score : int = 0

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	# Handle jump.
	if Input.is_action_just_pressed("move_up_player1") and is_on_floor():
		if Engine.time_scale != 0:
			velocity.y = JUMP_VELOCITY

	var direction := Input.get_axis("move_left_player1", "move_right_player1")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
