extends Area2D
var direction = Vector2.ZERO
var angle = -1

@onready var anim = $Sprite2D

func _ready() -> void:
	monitorable = false
	anim.visible = false

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
			_:
				pass
		rotate(deg_to_rad(angle))
		monitorable = true
		anim.visible = true
