extends Area2D

@onready var timer_level: Timer = $timer_change_level
@export var next_scene: PackedScene

func _on_body_entered(body: CharacterBody2D) -> void:
	add_score(body)
	change_level(next_scene)
	
func add_score(body: CharacterBody2D) -> void:
	if body.is_in_group("Players"):
		body.score += 1
		print(body.name, " 1+ point!")

func change_level(scene : PackedScene):
	$CollisionShape2D.queue_free()
	self.visible = false
	timer_level.start(3.0)
	await timer_level.timeout
	get_tree().change_scene_to_packed(scene)
	self.queue_free()
