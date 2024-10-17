extends StaticBody2D

func _on_hurtbox_body_entered(body: CharacterBody2D) -> void:
	if body.is_in_group("Players"):
		get_tree().reload_current_scene()
