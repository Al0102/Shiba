extends State

var scene = preload("res://scenes/main_menu/main_menu.tscn").instantiate()

# Travelable States
@export var game_top_down_state: State
@export var settings_state: State
@export var quit_state: State
var next_scene = null


func _ready():
	scene.start_button.pressed.connect( func(): next_scene = game_top_down_state )
	scene.settings_button.pressed.connect( func(): next_scene = settings_state )
	scene.quit_button.pressed.connect( func(): next_scene = quit_state )

func enter():
	print(name, " entered")
	owner.add_child(scene)
	
func process(delta) -> State:
	return next_scene
	
func exit():
	print(name, " exited")
	owner.remove_child(scene)
