extends StaticBody2D
@onready var colRay = $CollisionRay

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if colRay.is_colliding():
		remove_child($CollisionShape2D)
		remove_child($Animation)
