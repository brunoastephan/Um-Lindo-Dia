extends CharacterBody2D

@export var MAX_SPEED = 200
@export var ACCELERATION = 1500
@export var FRICTION = 1200
@onready var gpu_particles_2d = $GPUParticles2D
@onready var gpu_particles_2d_2 = $GPUParticles2D2
@onready var axis = Vector2.ZERO

const WINDY = preload("res://assets/PNG/nuvenzinha_particula_textura.png")
const RAINY = preload("res://assets/PNG/nuvenzinha_particula_chuva_textura.png")


func _ready():
	gpu_particles_2d.set_texture(WINDY)

	
func _physics_process(delta):
	move(delta)
	if gpu_particles_2d.is_visible_in_tree():
		generate_fluffy()
	change_skill()
	
func get_input_axis():
	axis.x = int(Input.is_action_pressed("Right", true)) - int(Input.is_action_pressed("Left", true))
	axis.y = int(Input.is_action_pressed("Down", true)) - int(Input.is_action_pressed("Up", true))
	
	return axis.normalized()

func move(delta):
	axis = get_input_axis()
	if axis == Vector2.ZERO:
		apply_friction(FRICTION * delta)
	else:
		apply_movement(axis * ACCELERATION * delta)
	move_and_slide()

func apply_friction(amount):
	if velocity.length() > amount:
		velocity -= velocity.normalized() * amount
	else:
		velocity = Vector2.ZERO

func apply_movement(accel):
	velocity += accel
	velocity = velocity.limit_length(MAX_SPEED)

func generate_fluffy():
	if velocity.x != 0 or velocity.y != 0:
		gpu_particles_2d.set_amount(300)
		gpu_particles_2d.set_lifetime(1)

func change_skill():
	if Input.is_action_just_pressed("Change Skill I", true) :
		gpu_particles_2d.show()
		gpu_particles_2d_2.hide()
		gpu_particles_2d.set_texture(RAINY)

	if Input.is_action_just_pressed("Change Skill II", true) :
		gpu_particles_2d.hide()
		gpu_particles_2d_2.show()
		
	if Input.is_action_just_pressed("Change Skill III", true):
		gpu_particles_2d.show()
		gpu_particles_2d_2.hide()
		gpu_particles_2d.set_texture(WINDY)
