extends StaticBody2D

var dragging = false
var offset = Vector2(0,0)
@onready var collision_shape = $CollisionShape2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if dragging:
		position = get_parent().to_local(get_global_mouse_position()) - offset


func _on_button_button_down():
	dragging = true
	offset = get_parent().to_local(get_global_mouse_position()) - position
	collision_shape.disabled = true  # Disable collision


func _on_button_button_up():
	dragging = false
	collision_shape.disabled = false  # Disable collision
