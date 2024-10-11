extends Control

@onready var single_play_button: TextureButton = $main_container/buttons_container/single_play_button


func _process(delta: float) -> void:
	hover_button_play()

func hover_button_play() -> void:
	if single_play_button.is_hovered():
		single_play_button.modulate = "ffba1e"
	else:
		single_play_button.modulate = "ffffff"
