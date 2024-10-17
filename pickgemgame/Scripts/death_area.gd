extends Area2D

@onready var reset_timer: Timer = $reset_timer

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Players"):
		reset_timer.start(1.0)

func _on_reset_timer_timeout() -> void:
	get_tree().reload_current_scene()
