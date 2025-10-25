extends Node

var cursor_atlas = preload("res://assets/fish_cursor.png")

@export var state_machine: StateMachine
var current_scene: Node

func customize_mouse () -> void:
	var cursor_texture = AtlasTexture.new()
	cursor_texture.atlas = cursor_atlas
	cursor_texture.region = Rect2(32, 0, 32, 32)
	Input.set_default_cursor_shape(Input.CURSOR_ARROW)
	Input.set_custom_mouse_cursor(cursor_texture, Input.CURSOR_POINTING_HAND, Vector2(0,16))
	cursor_texture.region = Rect2(0, 0, 32, 32)
	Input.set_custom_mouse_cursor(cursor_texture, Input.CURSOR_ARROW, Vector2(0,16))

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
#	Setup screen
	DisplayServer.window_set_size(Vector2i(640, 360))
	
#	Setup UI
	customize_mouse()
	
#	Start Scene State Machine
	state_machine.start()
	
