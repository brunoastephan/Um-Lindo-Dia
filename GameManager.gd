extends Node

@onready var nuvem = $"../Nuvem"
var form = 0
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _form_change(form):
	if Input.is_action_just_pressed("Change Skill", true):
		form +=1
		#if form > 2:
			#form = 0
func _get_form():
	return form
