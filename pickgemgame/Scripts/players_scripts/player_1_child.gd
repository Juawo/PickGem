extends "res://Scripts/players_scripts/player_bases.gd"

func _process(delta: float) -> void:
	if !is_death:
		if not is_on_floor():
			velocity += get_gravity() * delta
		
		if Input.is_action_just_pressed("move_up_player1") and is_on_floor():
			if Engine.time_scale != 0:
				player_jump_tween()
				player_sound_jump()
				velocity.y = JUMP_VELOCITY

		var direction := Input.get_axis("move_left_player1", "move_right_player1")
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)

		move_and_slide()
