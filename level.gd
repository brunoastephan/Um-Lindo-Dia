extends Node2D

@onready var nuvem = $Nuvem
@onready var broto = $Broto
@onready var coqueiro = $Coqueiro
@onready var npc = $npc
@onready var vara = $Vara
@onready var placa = $Placa
@onready var texture_rect = $CanvasLayer/Weather/TextureRect

const FIRE_SYMBOL = preload("res://assets/PNG/fire-symbol.jpg")
const WATER_SYMBOL = preload("res://assets/PNG/water_drop.jpg")
const WIND_SYMBOL = preload("res://assets/PNG/wind-symbol.jpg")

var water_growth
var heat_growth
var wind_coconut
var coqueiro_is_grown

# Called when the node enters the scene tree for the first time.
func _ready():
	water_growth = false
	heat_growth = false
	coqueiro_is_grown = false
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	bud_interact()
	growth()
	boat_npc_interact()
	npc_go_to_tree()
	

func boat_npc_interact():
	if vara.overlaps_body(nuvem):
		if Input.is_action_just_pressed("Skill", true) and texture_rect.get_texture() == FIRE_SYMBOL:
			npc.change_state(npc.STATE.FALL_ON_LAND)
			
func npc_go_to_tree():
	if placa.overlaps_body(nuvem):
		if Input.is_action_just_pressed("Skill", true) and texture_rect.get_texture() == WATER_SYMBOL and npc.get_state() == npc.STATE.STAY_ON_LAND and coqueiro_is_grown == true:
			npc.change_state(npc.STATE.MOVE_TO_TREE)

func bud_interact():
	if broto.overlaps_body(nuvem):
		if Input.is_action_just_pressed("Skill", true) and texture_rect.get_texture() == WATER_SYMBOL:
			water_growth = true
		if Input.is_action_just_pressed("Skill", true) and texture_rect.get_texture() == FIRE_SYMBOL:
			heat_growth = true
	
	
func growth():
	if water_growth and heat_growth:
		coqueiro_is_grown = true;
		broto.hide()
		coqueiro.show()
