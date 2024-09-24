extends Sprite2D


@onready var assets: Sprite2D = $Assets
@onready var platform_png: StaticBody2D = $Platform_png
@onready var holes: StaticBody2D = $Holes
@onready var block: StaticBody2D = $Block
@onready var nothing: StaticBody2D = $Nothing


func _on_push_pressed() -> void:
	assets.visible = true
	platform_png.visible = true
	holes.visible = true
	block.visible = true
	nothing.visible = true
