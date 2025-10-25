extends State

var scene = preload("res://scenes/world/world.tscn").instantiate()

# Travelable States
var next_scene = null


func _ready():
	pass

func enter():
	print(name, " entered")
	owner.add_child(scene)
	
func process(delta) -> State:
	return next_scene
	
func exit():
	print(name, " exited")
	owner.remove_child(scene)
