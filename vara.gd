extends Area2D

const VARA_DE_PESCA_QUENTE = preload("res://assets/PNG/vara_de_pesca_quente.png")

@onready var vara = $vara
var hot

func _ready():
	hot = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if hot == true:
		vara.set_texture(VARA_DE_PESCA_QUENTE)

func set_temperature():
	hot = true
