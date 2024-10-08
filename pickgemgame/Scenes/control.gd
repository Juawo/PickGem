extends Control

func _ready() -> void:
	$Label2.text = ("player 1 : " + str(players_data.score_player_1))
	$Label3.text = ("player 2 : " + str(players_data.score_player_2))
