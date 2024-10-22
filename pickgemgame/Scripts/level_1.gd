extends Node2D

var player_2_scene := preload("res://Scenes/Players/player_2.tscn")
@onready var player_1: CharacterBody2D = $player_1

func _ready() -> void:
	if players_data.multiplayer_on:
		player_1.position = Vector2(297,304)
		var player_2_instance = player_2_scene.instantiate()
		player_2_instance.position = Vector2(340,304)
		add_child(player_2_instance)
