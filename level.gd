extends Node2D

@onready var nuvem = $Nuvem
@onready var broto = $Broto
@onready var coqueiro = $Coqueiro
@onready var npc = $npc
@onready var vara = $Vara
@onready var texture_rect = $CanvasLayer/Weather/TextureRect

const FIRE_SYMBOL = preload("res://assets/PNG/fire-symbol.jpg")
const WATER_SYMBOL = preload("res://assets/PNG/water_drop.jpg")
const WIND_SYMBOL = preload("res://assets/PNG/wind-symbol.jpg")

var water_growth
var heat_growth
var wind_coconut

# Called when the node enters the scene tree for the first time.
func _ready():
	water_growth = false
	heat_growth = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	bud_interact()
	growth()
	

func boat_npc_interact():
	if ()

func bud_interact():
	if broto.overlaps_body(nuvem):
		if Input.is_action_just_pressed("Skill", true) and texture_rect.get_texture() == WATER_SYMBOL:
			water_growth = true
		if Input.is_action_just_pressed("Skill", true) and texture_rect.get_texture() == FIRE_SYMBOL:
			heat_growth = true
	
	
func growth():
	if water_growth and heat_growth:
		broto.hide()
		coqueiro.show()
