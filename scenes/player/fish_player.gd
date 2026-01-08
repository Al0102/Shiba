extends CharacterBody2D
class_name FishPlayerTop

@export var SWIM_SPEED: int
@export var FRICTION: int = 500

@export var reset_pressed_timer_max: float = 0.06

@onready var facing = 0.5*PI
@onready var prev_pressed = ""
@onready var reset_pressed_timer:float = 0


func _ready() -> void:
	$AnimatedSprite2D.play("Idle")


func _physics_process(delta: float) -> void:
	if reset_pressed_timer > 0:
		reset_pressed_timer -= delta
	else:
		if Input.is_action_just_released("flap_right") and not (prev_pressed == "right" and reset_pressed_timer > 0):
			facing += PI/5
			prev_pressed = "right"
			reset_pressed_timer = reset_pressed_timer_max
		if Input.is_action_just_released("flap_left") and not (prev_pressed == "left" and reset_pressed_timer > 0):
			facing -= PI/5
			prev_pressed = "left"
			reset_pressed_timer = reset_pressed_timer_max
		rotation = facing + PI/2
	if reset_pressed_timer == reset_pressed_timer_max:
		print(delta)
		var new_velocity = Vector2(cos(facing) * SWIM_SPEED * delta, sin(facing) * SWIM_SPEED * delta)
		velocity += new_velocity
		velocity = velocity.limit_length(100)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, 0.5)
	move_and_slide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
