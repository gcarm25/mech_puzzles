extends StaticBody2D
@onready var ExpRay = $ExpRay
@onready var anim = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ExpRay.is_colliding():
		anim.play(&"destroyed")
		await get_tree().create_timer(0.75).timeout
		free()
