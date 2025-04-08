extends StaticBody2D
var is_pressed = false
@onready var PowRay = $RayCast2D
@onready var Collision = $CollisionShape2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if PowRay.is_colliding():
		Collision.disabled = false
		#print("wire is powered")
	else:
		Collision.disabled = true
