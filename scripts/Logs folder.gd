extends Sprite2D


@onready var text_log: Sprite2D = $Text_log


func _on_push_pressed() -> void:
	text_log.visible = true
