extends  Button


func _on_pressed() -> void:
	get_parent().visible = false  # Hide the parent of the button
