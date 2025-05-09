extends StaticBody2D
@onready var fillRay = $CollisionRay
@onready var dthRay = $DeathRay
@onready var anim = $Animation

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if dthRay.is_colliding():
		pass
	elif fillRay.is_colliding():
		anim.pause()
		await get_tree().create_timer(0.5).timeout
		free()
