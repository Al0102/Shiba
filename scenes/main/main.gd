extends Node

var cursor_atlas = preload("res://assets/fish_cursor.png")

var main_menu = preload("res://scenes/main_menu.tscn").instantiate()
var current_scene: Node

func change_scene(new_scene):
	if new_scene:
		remove_child(current_scene)
		add_child(new_scene)

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
#	Setup UI
	customize_mouse()
	
#	Setup scenes
	current_scene = main_menu
	add_child(main_menu)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	change_scene(main_menu.process(delta))
