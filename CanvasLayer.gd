extends CanvasLayer
@onready var texture_rect = $Weather/TextureRect
const FIRE_SYMBOL = preload("res://assets/PNG/icon_sol.png")
const WATER_SYMBOL = preload("res://assets/PNG/icon_chuva.png")
const WIND_SYMBOL = preload("res://assets/PNG/icon_vento.png")
var state

func _ready():
	texture_rect.set_texture(WIND_SYMBOL)
	
func _process(delta):
	change_weather()

func change_weather():
	if Input.is_action_just_pressed("Change Skill I", true) :
		texture_rect.set_texture(WATER_SYMBOL)
		
	if Input.is_action_just_pressed("Change Skill II", true) :
		texture_rect.set_texture( FIRE_SYMBOL)
		
	if Input.is_action_just_pressed("Change Skill III", true):
		texture_rect.set_texture(WIND_SYMBOL)
