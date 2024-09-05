extends StaticBody2D

var dragging = false
var of = Vector2.ZERO
@onready var collision_shape_2d = $CollisionShape2D
@onready var platform = $"."

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if dragging:
		position = get_parent().to_local(get_global_mouse_position()) - of


func _on_button_button_down():
	dragging = true
	of = get_parent().to_local(get_global_mouse_position()) - position
	collision_shape_2d.disabled = true
	platform.scale = Vector2(0.9, 0.9)

func _on_button_button_up():
	dragging = false
	collision_shape_2d.disabled = false
	platform.scale = Vector2(1, 1)
