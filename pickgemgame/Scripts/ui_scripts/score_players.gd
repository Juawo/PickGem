extends Control

@onready var score_player_2: HBoxContainer = $score_player_2
@onready var gem: Area2D = $"../gem"

@onready var label_p1: Label = $score_player_1/label_score_player_1
@onready var label_p2: Label = $score_player_2/label_score_player_2

@export var two_players : bool

var initial_position : Vector2
var initial_score_position_p1 : Vector2
var initial_score_position_p2 : Vector2
var initial_score_p1 : int
var initial_score_p2 : int

func _ready() -> void:
	initial_position = global_position
	initial_score_position_p1 = label_p1.position
	initial_score_p1 = players_data.score_player_1 
	two_players = players_data.multiplayer_on
	gem.score_changed.connect(score_changed_tween)
	
	if two_players:
		score_player_2.show()
		initial_score_p2 = players_data.score_player_2 
		initial_score_position_p2 = label_p2.position
		
func _process(delta: float) -> void:
	label_p1.text = str(players_data.score_player_1) + "x"
	if two_players:
		label_p2.text = str(players_data.score_player_2) + "x"

func score_changed_tween(name_player):
	if name_player == "player_1":
		tween_score(label_p1)
	if name_player == "player_2":
		tween_score(label_p2)

func tween_score(node_ref):
	var score_change_tween = get_tree().create_tween().set_parallel(true)
	score_change_tween.set_ease(Tween.EASE_IN)
	score_change_tween.set_trans(Tween.TRANS_EXPO)
	
	score_change_tween.tween_property(node_ref, "position:y", -10, 0.2).as_relative()
	score_change_tween.tween_property(node_ref, "modulate", Color("#f7bc30"), 0.2)
	score_change_tween.connect("finished", Callable(self, "tween_score_back").bind(node_ref))
	#score_change_tween.tween_callback(Callable(self,"tween_score_back").bind(node_ref))

func tween_score_back(node_ref):
	var score_change_tween_back = get_tree().create_tween().set_parallel(true)
	
	score_change_tween_back.set_ease(Tween.EASE_OUT)
	score_change_tween_back.set_trans(Tween.TRANS_EXPO)
	
	score_change_tween_back.tween_property(node_ref, "position:y", 10, 0.2 ).as_relative()

	score_change_tween_back.tween_property(node_ref, "modulate", Color("#ffffff"), 0.2)
