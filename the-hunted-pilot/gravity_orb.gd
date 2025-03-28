extends Area2D
var direction = Vector2.RIGHT
@onready var collision = $RayCast2D
var should_be_dead = false
var angle = -1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if angle == -1:
		match direction:
			Vector2.RIGHT:
				angle = 0
			Vector2.DOWN:
				angle = 90
			Vector2.LEFT:
				angle = 180
			Vector2.UP:
				angle = 270
		rotate(deg_to_rad(angle))
	position += direction * 60 * delta
	if collision.is_colliding():
		var should_be_dead = true
		free()
