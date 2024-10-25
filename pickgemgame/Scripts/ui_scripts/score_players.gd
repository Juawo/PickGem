extends Control

@onready var label: Label = $score_player_1/Label
@onready var label_2: Label = $score_player_2/Label

@export var two_players : bool 
@onready var score_player_2: HBoxContainer = $score_player_2

var initial_position : Vector2

func _ready() -> void:
	initial_position = global_position
	two_players = players_data.multiplayer_on 
	if two_players:
		score_player_2.show()
		
func _process(delta: float) -> void:
	label.text = str(players_data.score_player_1) + "x"
	if two_players:
		label_2.text = str(players_data.score_player_2) + "x"
