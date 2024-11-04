extends CharacterBody2D

@onready var respawn_timer: Timer = $respawn_timer
@onready var collision: CollisionShape2D = $collision
@onready var cpu_particles_p_1: CPUParticles2D = $cpu_particles_P1
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var jump_particles: CPUParticles2D = $jump_particles
@onready var sound_jump: AudioStreamPlayer = $sound_jump
@onready var sound_death: AudioStreamPlayer = $sound_death

@export var respawn_time : float = 1.5

const SPEED = 220.0
const JUMP_VELOCITY = -280.0

var score : int = 0
var initial_position : Vector2
var is_death := false
var tween

func _ready() -> void:
	initial_position = self.global_position
	tween = get_tree().create_tween()
	
func player_death():
	is_death = true
	sprite_2d.hide()
	collision.disabled = is_death
	respawn_timer.start(respawn_time)
	player_particles()
	player_death_sound()

func player_death_sound():
	sound_death.play()
func player_respawn():
	is_death = false
	collision.disabled = is_death
	velocity = Vector2.ZERO
	global_position = initial_position
	sprite_2d.show()

func player_sound_jump():
	sound_jump.play()

func player_particles():
	cpu_particles_p_1.emitting = true
	cpu_particles_p_1.global_position.x = self.global_position.x

func player_jump_particles():
	jump_particles.emitting = true
	
func player_jump_tween():
	var jump_tween = get_tree().create_tween()
	
	jump_tween.set_ease(Tween.EASE_OUT)
	jump_tween.set_trans(Tween.TRANS_SINE)
	player_jump_particles()
	jump_tween.tween_property(self,"scale", Vector2(0.6,0.9), 0.2)
	
	jump_tween.tween_callback(Callable(self, "end_jump_tween"))
	
func end_jump_tween():
	var jump_end_tween = get_tree().create_tween()
	jump_end_tween.set_ease(Tween.EASE_IN)
	jump_end_tween.set_trans(Tween.TRANS_SINE)
	jump_end_tween.tween_property(self, "scale", Vector2(0.72,0.76), 0.2)

func _on_respawn_timer_timeout() -> void:
	player_respawn()
