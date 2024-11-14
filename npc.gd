extends CharacterBody2D

enum STATE {
	IDLE,
	START_ON_BOAT,
	FALL_IN_POND,
	MOVE_TO_LAND,
	MOVE_TO_TREE,
	MOVE_RANDOM,
}

const speed = 100
const gravity = 9.8
var current_state = STATE.IDLE
var target_position = Vector2()
var direction

func _ready():
	target_position = position

func _physics_process(delta):
	match current_state:
		STATE.IDLE:
			$AnimatedSprite2D.play("idle")
			current_state = STATE.MOVE_TO_TREE
			target_position = Vector2(500,306)
			
		STATE.MOVE_TO_TREE:
			direction = (target_position - position).normalized()
			move(delta, direction)
			if position.distance_to(target_position) < abs(2):
				current_state = STATE.MOVE_RANDOM
		
		STATE.MOVE_RANDOM:
			var random_direction = Vector2(randf_range(-1, 1), 306).normalized()
			move(delta, random_direction)
			
			
func move(delta, direction):
	if(direction.x > 0):
		$AnimatedSprite2D.flip_h = false
	if(direction.x <= 0):
		$AnimatedSprite2D.flip_h = true
		
	velocity = direction * speed
	velocity.y = 0
	move_and_slide()
	$AnimatedSprite2D.play("walk")
	
