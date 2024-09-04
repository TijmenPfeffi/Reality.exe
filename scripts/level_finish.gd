extends Area2D

@onready var level_1: Node = get_tree().root.get_node("Game/level_1")
@onready var level_2: Node = get_tree().root.get_node("Game/level_2")


func _on_body_entered(body):
	if body is CharacterBody2D:
		if level_1:
			level_1.get_parent().add_child(level_2)
			level_1.get_parent().remove_child(level_1)
