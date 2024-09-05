extends Area2D

# Load the PackedScene for level_1
@onready var level_1_scene: PackedScene = preload("res://scenes/level_1.tscn")

# Reference to the current instance of level_1
@onready var level_1: Node = get_tree().root.get_node("Game/level_1")

func _on_body_entered(body):
	if body is CharacterBody2D:
		print("You died!")
		
		# Get the parent node of level_1
		var parent = level_1.get_parent()
		# Create a new instance of level_1
		var new_level_1 = level_1_scene.instantiate()
		
		# Add the new instance of level_1 to the parent
		parent.add_child(new_level_1)

		# Remove the current instance of level_1
		parent.remove_child(level_1)
		level_1.queue_free()  # Free the old instance
		
		
		
	
