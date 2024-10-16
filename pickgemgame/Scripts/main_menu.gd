extends Control

func _on_single_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Levels/level_1.tscn")
