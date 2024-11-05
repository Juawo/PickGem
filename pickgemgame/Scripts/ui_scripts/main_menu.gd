extends Control

func _ready() -> void:
	BgSoundtrackGlobal.play_music_level(-5.0)

func _on_single_play_button_pressed() -> void:
	players_data.multiplayer_on = false
	get_tree().change_scene_to_file("res://Scenes/Levels/level_1.tscn")


func _on_credits_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/UI/credits.tscn")

func _on_multi_play_button_pressed() -> void:
	players_data.multiplayer_on = true
	get_tree().change_scene_to_file("res://Scenes/Levels/level_1.tscn")
