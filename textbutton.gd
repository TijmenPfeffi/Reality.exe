extends Button

func _on_pressed() -> void:
	var child_node = get_child(0)  # Get the first child of the button
	child_node.visible = true  # Unhide the child
