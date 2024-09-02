extends Sprite2D

var dragging = false
var of = Vector2.ZERO

func _process(delta):
	if dragging:
		position = get_parent().to_local(get_global_mouse_position()) - of

func _on_drag_button_down():
	dragging = true
	of = get_parent().to_local(get_global_mouse_position()) - position


func _on_drag_button_up():
	dragging = false
	


		self.visible = false


func _on_hide_pressed():
	pass # Replace with function body.
