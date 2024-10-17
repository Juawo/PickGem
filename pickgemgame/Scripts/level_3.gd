extends Node2D

var player_2_scene := preload("res://Scenes/Players/player_2.tscn")

func _ready() -> void:
	if players_data.multiplayer_on:
		var player_2_instance = player_2_scene.instantiate()
		player_2_instance.position = Vector2(549,238)
		add_child(player_2_instance)