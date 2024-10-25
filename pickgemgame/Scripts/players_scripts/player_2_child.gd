extends "res://Scripts/players_scripts/player_bases.gd"

func _process(delta: float) -> void:
	if !is_death:
		if not is_on_floor():
			velocity += get_gravity() * delta
		
		if Input.is_action_just_pressed("move_up_player2") and is_on_floor():
			if Engine.time_scale != 0:
				player_jump_tween()
				velocity.y = JUMP_VELOCITY

		var direction := Input.get_axis("move_left_player2", "move_right_player2")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

		move_and_slide()
