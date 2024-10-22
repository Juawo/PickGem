extends Control

@onready var player_win_label: Label = $margin_container_content/panel_container_content/margin_content/vertical_container_content/player_win_label

@onready var player_1_score_label: Label = $margin_container_content/panel_container_content/margin_content/vertical_container_content/horizontal_container_scores/player_1_container/player_1_score_label
@onready var player_2_score_label: Label = $margin_container_content/panel_container_content/margin_content/vertical_container_content/horizontal_container_scores/player_2_container/player_2_score_label
@onready var player_2_container: VBoxContainer = $margin_container_content/panel_container_content/margin_content/vertical_container_content/horizontal_container_scores/player_2_container

func _ready() -> void:
	players_score()
	player_wins()

func players_score():
	if players_data.multiplayer_on:
		player_1_score_label.text = "Score : " + str(players_data.score_player_1)
		player_2_score_label.text = "Score : " + str(players_data.score_player_2)
	else:
		player_2_container.hide()
		player_1_score_label.text = "Score : " + str(players_data.score_player_1)
	
func player_wins():
	if players_data.multiplayer_on:
		if players_data.score_player_1 > players_data.score_player_2:
			player_win_label.text = "Player 1 WIN!!"
		else:
			player_win_label.text = "Player 2 WIN!!"
	else:
		player_win_label.text = "YOU WIN!!"
