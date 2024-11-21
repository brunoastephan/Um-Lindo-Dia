extends Area2D

@export var speed = 300
var kill = false

func start_coconut(pos):
	position = pos
		
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y += delta * speed


func _on_body_entered(body):
	if body.name == "npc":
		kill = true
		

func get_kill():
	return kill
