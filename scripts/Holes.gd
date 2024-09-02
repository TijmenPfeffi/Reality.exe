extends StaticBody2D

var dragging = false
var of = Vector2.ZERO
@onready var player = $"../pop-up game/Player"
@onready var timer = $Timer
var saved_collision_shape: CollisionShape2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if dragging:
		position = get_parent().to_local(get_global_mouse_position()) - of

func _on_button_button_down():
	dragging = true
	of = get_parent().to_local(get_global_mouse_position()) - position

func _on_button_button_up():
	dragging = false

func _on_area_2d_body_entered(body):
	if body is CharacterBody2D:
		saved_collision_shape = player.get_node("CollisionShape2D")
		player.remove_child(saved_collision_shape)
		timer.start()


func _on_timer_timeout():
	if not player.has_node("CollisionShape2D") and saved_collision_shape:
		player.add_child(saved_collision_shape)
		saved_collision_shape = null  # Clear the reference after re-adding
