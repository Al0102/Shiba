extends Button
class_name FocusButton

func _on_mouse_entered():
	grab_focus()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	mouse_entered.connect(_on_mouse_entered)
