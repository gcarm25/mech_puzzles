extends StaticBody2D
@onready var WinRay = $WinRay
@onready var Sprite = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if WinRay.is_colliding():
		Sprite.play(&"opening")
		await get_tree().create_timer(0.75).timeout
		get_tree().change_scene_to_file("res://levels//Testing_Level.tscn")
