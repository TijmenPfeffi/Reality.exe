extends Area2D

@onready var level_3: Node = get_tree().root.get_node("Game/level_3")
@onready var level_4: Node = get_tree().root.get_node("Game/level_4")
@onready var dave_5: Sprite2D = get_tree().root.get_node("Game/dave5")



func _on_body_entered(body):
	if body is CharacterBody2D:
		if level_3:
			level_3.get_parent().add_child(level_4)
			level_3.get_parent().remove_child(level_3)
			dave_5.visible = true
