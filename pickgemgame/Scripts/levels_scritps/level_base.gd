extends Node2D

@export var initial_position_p2 : Vector2
var player2_scene := preload("res://Scenes/Players/player_2.tscn")

func _ready() -> void:
	BgSoundtrackGlobal.play_music_level(-5.0)
	if players_data.multiplayer_on:
		var player2_instance = player2_scene.instantiate()
		player2_instance.global_position = initial_position_p2
		add_child(player2_instance)
		
