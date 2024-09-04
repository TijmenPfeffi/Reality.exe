extends Area2D

@onready var level_2: Node = get_tree().root.get_node("Game/level_2")
@onready var level_3: Node = get_tree().root.get_node("Game/level_3")

func _on_body_entered(body):
	if body is CharacterBody2D:
		if level_2:
			level_2.get_parent().add_child(level_3)
			level_2.get_parent().remove_child(level_2)
