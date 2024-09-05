extends StaticBody2D

var dragging = false
var of = Vector2.ZERO
@onready var timer = $Timer
var saved_collision_shape: CollisionShape2D
var player: Node = null  # Store reference to player
@onready var collision_shape_2d = $Area2D/CollisionShape2D
@onready var holes = $"."

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if dragging:
		position = get_parent().to_local(get_global_mouse_position()) - of

func _on_button_button_down():
	dragging = true
	of = get_parent().to_local(get_global_mouse_position()) - position
	collision_shape_2d.disabled = true
	holes.scale = Vector2(0.9, 0.9)

func _on_button_button_up():
	dragging = false
	collision_shape_2d.disabled = false
	holes.scale = Vector2(1, 1)

func _on_area_2d_body_entered(body):
	if body is CharacterBody2D:
		if not player:
			player = find_player()  # Locate the player dynamically
		if player:
			saved_collision_shape = player.get_node("CollisionShape2D")
			player.remove_child(saved_collision_shape)
			timer.start()

func _on_timer_timeout():
	if player and not player.has_node("CollisionShape2D") and saved_collision_shape:
		player.add_child(saved_collision_shape)
		saved_collision_shape = null  # Clear the reference after re-adding

# Function to search for the player node dynamically
func find_player() -> Node:
	# Recursively search for the player in the scene tree
	return get_tree().get_root().find_child("Player", true, false)
