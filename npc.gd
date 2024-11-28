extends CharacterBody2D

const COCONUT = preload("res://coconut.tscn")

enum STATE {
	IDLE,
	START_ON_BOAT,
	STAY_ON_LAND,
	FALL_ON_LAND,
	MOVE_TO_TREE,
	STAY_IN_TREE,
	DYING,
}

const launch_speed = 500
const launch_angle = 70
const speed = 100
const gravity = 400
const boat_position = Vector2(534, 985)
const land_position = Vector2(974, 985)
const tree_position = Vector2(1720, 985)
var current_state = STATE.START_ON_BOAT
var start_position = Vector2()
var direction

func _ready():
	start_position = boat_position
	$AnimatedSprite2D.flip_h = true
	var radians = deg_to_rad(launch_angle)
	velocity.x = launch_speed * cos(radians)
	velocity.y = -launch_speed * sin(radians)  # Negative because upward is -y

func _physics_process(delta):
	match current_state:
		STATE.IDLE:
			$AnimatedSprite2D.play("idle")
		
		STATE.START_ON_BOAT:
			$AnimatedSprite2D.play("idle")
			
		STATE.FALL_ON_LAND:
			velocity.y += gravity * delta
			position += velocity * delta
			
			if position.y >= start_position.y:
				position.y = start_position.y
				velocity = Vector2()  # Stop movement
				current_state = STATE.STAY_ON_LAND
				
		STATE.STAY_ON_LAND:
			$AnimatedSprite2D.play("idle")
			
		STATE.MOVE_TO_TREE:
			direction = (tree_position - land_position).normalized()
			move(delta, direction)
			if position.distance_to(tree_position) < abs(20):
				current_state = STATE.STAY_IN_TREE
		
		STATE.STAY_IN_TREE:
			$AnimatedSprite2D.play("idle")
		
		STATE.DYING:
			$AnimatedSprite2D.play("dying")
			if $AnimatedSprite2D.get_frame() == 4:
				$AnimatedSprite2D.pause()
				
func move(delta, direction):
	if(direction.x > 0):
		$AnimatedSprite2D.flip_h = false
	if(direction.x <= 0):
		$AnimatedSprite2D.flip_h = true
		
	velocity = direction * speed
	velocity.y = 0
	move_and_slide()
	$AnimatedSprite2D.play("walk")

func change_state(state):
	current_state = state
	
func get_state():
	return current_state
	


