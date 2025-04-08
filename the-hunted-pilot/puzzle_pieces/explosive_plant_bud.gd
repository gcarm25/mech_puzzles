extends StaticBody2D
@onready var explosion = $CollisionShape2D
@onready var anim = $Sprite2D
var exploding = false
var direction = Vector2.ZERO
var initial_position = position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if exploding:
		position = initial_position
		match direction:
			Vector2.RIGHT:
				anim.play(&"right_explosive")
				await get_tree().create_timer(.75).timeout
				explosion.disabled = false
				await get_tree().create_timer(.25).timeout
				free()
			Vector2.DOWN:
				anim.play(&"bottom_explosive")
				await get_tree().create_timer(.75).timeout
				explosion.disabled = false
				await get_tree().create_timer(.25).timeout
				free()
			Vector2.LEFT:
				anim.play(&"left_explosive")
				await get_tree().create_timer(.75).timeout
				explosion.disabled = false
				await get_tree().create_timer(.25).timeout
				free()
			Vector2.UP:
				anim.play(&"top_explosive")
				await get_tree().create_timer(.75).timeout
				explosion.disabled = false
				await get_tree().create_timer(.25).timeout
				free()
			_:
				pass
