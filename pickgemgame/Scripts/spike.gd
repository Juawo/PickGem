extends StaticBody2D

func _on_hurt_box_body_entered(body: CharacterBody2D) -> void:
	if body.is_in_group("Players"):
		body.player_death()
