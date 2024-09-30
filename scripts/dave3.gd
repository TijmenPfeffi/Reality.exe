extends Area2D


@onready var dave_3: Sprite2D = get_tree().root.get_node("Game/dave3")



func _on_body_entered(body):
	if body is CharacterBody2D:
		dave_3.visible = true
