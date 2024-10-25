extends Area2D

@onready var cpu_particles_p1: CPUParticles2D = $cpu_particles_P1
@onready var cpu_particles_p2: CPUParticles2D = $cpu_particles_P2

var player_is_death : CharacterBody2D

func _on_body_entered(body: CharacterBody2D) -> void:
	if body.is_in_group("Players"):
		body.player_death()

#func death_particle(player: CharacterBody2D):
	#if player.is_in_group("Players"):
		#if player.name == "player_1":
			#cpu_particles_p1.global_position.x = player.global_position.x
			#cpu_particles_p1.emitting = true
		#if player.name == "player_2":
			#cpu_particles_p2.global_position.x = player.global_position.x
			#cpu_particles_p2.emitting = true
