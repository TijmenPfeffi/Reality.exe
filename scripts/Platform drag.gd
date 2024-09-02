extends StaticBody2D

var dragging = false
var of = Vector2.ZERO

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if dragging:
		position = get_parent().to_local(get_global_mouse_position()) - of


func _on_button_button_down():
	dragging = true
	of = get_parent().to_local(get_global_mouse_position()) - position

func _on_button_button_up():
	dragging = false
