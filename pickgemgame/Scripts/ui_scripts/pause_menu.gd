extends Control

var paused := false
@onready var color_rect: ColorRect = $ColorRect

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		pause_menu()

func pause_menu() -> void:
	if paused:
		self.hide()
		Engine.time_scale = 1
	else:
		self.show()
		Engine.time_scale = 0
	paused = !paused
	
func _on_replay_button_pressed() -> void:
	pause_menu()

func _on_return_button_pressed() -> void:
	players_data.score_player_1 = 0
	players_data.score_player_2 = 0
	pause_menu()
	get_tree().change_scene_to_file("res://Scenes/UI/main_menu.tscn")
