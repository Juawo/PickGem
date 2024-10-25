extends Node2D

@export var initial_position_p2 : Vector2
var player2_scene := preload("res://Scenes/Players/player_2.tscn")

func _ready() -> void:
	if players_data.multiplayer_on:
		var player2_instance = player2_scene.instantiate()
		player2_instance.global_position = initial_position_p2
		print("TWo")
		add_child(player2_instance)
		
