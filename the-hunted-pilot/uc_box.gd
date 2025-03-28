extends StaticBody2D
@onready var colRay = $CollisionRay

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("click"):
		position.x += 32
	if colRay.is_colliding():
		remove_child($CollisionShape2D)
		remove_child($Sprite2D)
