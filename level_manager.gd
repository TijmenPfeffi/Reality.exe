extends Node

@onready var level_1: Node = get_tree().root.get_node("Game/level_1")
@onready var level_2: Node = get_tree().root.get_node("Game/level_2")
@onready var level_3: Node = get_tree().root.get_node("Game/level_3")
@onready var level_4: Node = get_tree().root.get_node("Game/level_4")

func _ready():
	# Defer the removal of level_2 to ensure it's safe
	if level_2 and level_2.get_parent():  # Ensure level_2 exists and has a parent
		level_2.get_parent().call_deferred("remove_child", level_2)

	if level_3 and level_3.get_parent():  
		level_3.get_parent().call_deferred("remove_child", level_3)

	if level_4 and level_4.get_parent():  
		level_4.get_parent().call_deferred("remove_child", level_4)
#
	#if level_5 and level_5.get_parent():  
		#level_5.get_parent().call_deferred("remove_child", level_5)
#
	#if level_6 and level_6.get_parent():  
		#level_6.get_parent().call_deferred("remove_child", level_6)
#
	#if level_7 and level_7.get_parent():  
		#level_7.get_parent().call_deferred("remove_child", level_7)
