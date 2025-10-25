extends Node
class_name StateMachine

@export var init_state: State

@onready var current_state: State = (
	func get_init_state() -> State:
		return init_state if init_state != null else get_child(0)).call()
var prev_state: State

func _ready():
	process_mode = Node.PROCESS_MODE_DISABLED

func start():
	if get_child_count() <= 0:
		push_warning("State Machine has no states")
	prev_state = current_state
	current_state.enter()
	process_mode = Node.PROCESS_MODE_INHERIT

func stop():
	process_mode = Node.PROCESS_MODE_DISABLED

func _process(delta: float) -> void:
	change_state(current_state.process(delta))

func _physics_process(delta: float) -> void:
	change_state(current_state.physics(delta))
	
func _unhandled_input(event: InputEvent) -> void:
	change_state(current_state.input(event))
	
func _input(event: InputEvent) -> void:
	change_state(current_state.input(event))
	
func change_state(new_state: State):
	if new_state == null or new_state == current_state:
		return
	print("test")

	if current_state:
		current_state.exit()

	prev_state = current_state
	current_state = new_state

	current_state.enter()
	
	
