extends CharacterBody2D
class_name FishPlayerTop

@export var animation_tree: AnimationTree


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func _physics_process(delta: float) -> void:
	velocity = Input.get_vector("move_left", "move_right", "move_down", "move_up")
	velocity = velocity.normalized()
	
	if velocity != Vector2.ZERO:
		animation_tree.set("parameters/Idle/blend_position", velocity)
	
	move_and_slide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
