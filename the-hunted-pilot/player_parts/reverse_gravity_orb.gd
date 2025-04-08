extends Area2D
var direction = Vector2.RIGHT
@onready var hitBox = $CollisionShape2D
@onready var collision = $RayCast2D
@onready var anim = $Sprite2D
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
	if collision.is_colliding():
		should_be_dead = true
		hitBox.disabled = true
		anim.play(&"contact")
		await get_tree().create_timer(0.5).timeout
		free()
	elif !should_be_dead:
		position += direction * 128 * delta
