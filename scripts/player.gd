extends CharacterBody2D

#@onready var game_manager = %game_manager

const SPEED = 250.0
const JUMP_VELOCITY = -300.0
var input_active: bool = true

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var fallGravity = gravity * 1.5

@onready var animated_sprite = $AnimatedSprite2D

#@onready var audio_player = %AudioStreamPlayer2D
#var jumpSound = preload("res://Assets/sounds/jump.wav")
#func _ready():
	#for i in range(1,11):
		#set_collision_mask_value(i, false)
	#set_collision_mask_value(1, true)
	#set_collision_mask_value(game_manager.current_layer, true)


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += get_Gravity(velocity) * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		#audio_player.stream = jumpSound
		#audio_player.play()
	if Input.is_action_just_released("jump") and velocity.y < 0:
		velocity.y = JUMP_VELOCITY / 4
	
	# Get the input direction: -1, 0 or 1
	var direction = Input.get_axis("move_left", "move_right")
	
	#Flip the Sprite
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
	
	#Play animations
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")
	
	#Apply movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if input_active == false:
		velocity.x = 0
		velocity.y = 0

	move_and_slide()

func get_Gravity(velocity: Vector2):
	if velocity.y < 0:
		return gravity
	return fallGravity
