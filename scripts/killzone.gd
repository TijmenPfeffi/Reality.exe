extends Area2D

@onready var timer = $Timer
@onready var player = %Player
@onready var game_manager = %game_manager

@export var respawnPos:= Vector2(640, 630)

func _on_body_entered(body):
	print("You died!")
	player.input_active = false
	timer.start()

func _on_timer_timeout():
	game_manager.switchLayer(10)
	player.global_position = respawnPos
	player.input_active = true
	


