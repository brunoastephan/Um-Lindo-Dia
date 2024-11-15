extends Node2D

@onready var gpu_particles_2d = $CharacterBody2D/GPUParticles2D
const WINDY = preload("res://assets/PNG/nuvenzinha_particula_textura.png")
const SUNNY = preload("res://assets/PNG/Sunny.png")
const RAINY = preload("res://assets/PNG/nuvenzinha_particula_chuva_textura.png")

func _ready():
	gpu_particles_2d.set_texture(WINDY)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	change_skill()
	
func change_skill():
	if Input.is_action_just_pressed("Change Skill I", true) :
		gpu_particles_2d.set_texture(RAINY)
		
	if Input.is_action_just_pressed("Change Skill II", true) :
		gpu_particles_2d.set_texture(SUNNY)
		
	if Input.is_action_just_pressed("Change Skill III", true):
		gpu_particles_2d.set_texture(WINDY)
