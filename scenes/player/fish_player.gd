extends CharacterBody2D
class_name FishPlayerTop

@export var SWIM_SPEED: int

@export var animation_tree: AnimationTree


func _physics_process(delta: float) -> void:
	velocity = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = velocity.normalized()
	velocity *= SWIM_SPEED * delta
	
	if velocity != Vector2.ZERO:
		animation_tree.set("parameters/Idle/blend_position", velocity)
	
	move_and_slide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
