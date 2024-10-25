extends CharacterBody2D

@onready var respawn_timer: Timer = $respawn_timer
@onready var collision: CollisionShape2D = $collision
@onready var cpu_particles_p_1: CPUParticles2D = $cpu_particles_P1
@onready var sprite_2d: Sprite2D = $Sprite2D

@export var respawn_time : float = 1.5

const SPEED = 220.0
const JUMP_VELOCITY = -280.0

var score : int = 0
var initial_position : Vector2
var is_death := false

func _ready() -> void:
	initial_position = self.global_position
	
func player_death():
	is_death = true
	sprite_2d.hide()
	collision.disabled = is_death
	respawn_timer.start(respawn_time)
	player_particles()

func player_respawn():
	is_death = false
	collision.disabled = is_death
	velocity = Vector2.ZERO
	global_position = initial_position
	sprite_2d.show()

func player_particles():
	print('emitiu')
	cpu_particles_p_1.emitting = true
	cpu_particles_p_1.global_position.x = self.global_position.x
	
func _on_respawn_timer_timeout() -> void:
	player_respawn()
