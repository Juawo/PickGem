extends Area2D

@onready var timer_level: Timer = $timer_change_level
@export var next_scene: PackedScene

func _on_body_entered(body: CharacterBody2D) -> void:
	add_score(body)
	change_level(next_scene)
	
func add_score(body: CharacterBody2D) -> void:
	if body.is_in_group("Players"):
		if(body.name == "player_1"):
			players_data.score_player_1 += 1
		if(body.name == "player_2"):
			players_data.score_player_2 += 1
		body.score += 1
		print("Player 1: ",str(players_data.score_player_1),"\n Player 2: ", str(players_data.score_player_2) )

func change_level(scene : PackedScene):
	$CollisionShape2D.queue_free()
	self.visible = false
	timer_level.start(1.0)
	await timer_level.timeout
	get_tree().change_scene_to_packed(scene)
	self.queue_free()
