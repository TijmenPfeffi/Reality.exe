extends Area2D

var entered = false
@onready var level_1: Sprite2D = $level_1
@onready var level_2: Sprite2D = $level_2


func _on_body_entered(body):
	if body is CharacterBody2D:
		get_tree().get_root().remove_child(level_1)
		#level.visible = true
