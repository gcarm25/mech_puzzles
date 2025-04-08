extends StaticBody2D
var is_pressed = false
@onready var Sprite = $AnimatedSprite2D
@onready var ColRay = $RayCast2D
@onready var Collision = $CollisionShape2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_pressed == true:
		Sprite.play(&"active")
	else:
		Sprite.play(&"default")
	if ColRay.is_colliding():
		is_pressed = true
		Collision.disabled = false
	else:
		is_pressed = false
		Collision.disabled = true
