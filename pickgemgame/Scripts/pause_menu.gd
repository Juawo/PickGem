extends Control

var pause_visible = false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		self.visible = !pause_visible
		pause_visible = !pause_visible

func _on_replay_button_pressed() -> void:
	self.visible = !pause_visible
	pause_visible = !pause_visible


func _on_return_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/UI/main_menu.tscn")
