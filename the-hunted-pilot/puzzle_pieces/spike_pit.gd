extends StaticBody2D
@onready var fillRay = $BoxRay
@onready var coverRay = $BridgeRay
@onready var anim = $Animation
@onready var collision = $CollisionShape2D
var covered = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if fillRay.is_colliding() and !covered:
		anim.pause()
		await get_tree().create_timer(0.75).timeout
		free()
	elif coverRay.is_colliding():
		collision.disabled = true
		covered = true
	else:
		collision.disabled = false
		covered = false
	
