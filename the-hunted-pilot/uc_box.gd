extends StaticBody2D
@onready var pitRayL = $PitRayL
@onready var pitRayR = $PitRayR
@onready var pitRayU = $PitRayU
@onready var pitRayD = $PitRayD
@onready var gravRayL = $GravityDetectorL
@onready var gravRayR = $GravityDetectorR
@onready var gravRayU = $GravityDetectorU
@onready var gravRayD = $GravityDetectorD
var grav_push = false
var push_direction = Vector2.RIGHT
var speed = push_direction

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#if Input.is_action_just_pressed("click"):
	#	position.x += 32
	if gravRayL.is_colliding():
		grav_push = true
		push_direction = Vector2.RIGHT
		speed = push_direction * 128
	elif gravRayR.is_colliding():
		grav_push = true
		push_direction = Vector2.LEFT
		speed = push_direction * 128
	elif gravRayU.is_colliding():
		grav_push = true
		push_direction = Vector2.DOWN
		speed = push_direction * 128
	elif gravRayD.is_colliding():
		grav_push = true
		push_direction = Vector2.UP
		speed = push_direction * 128
	if pitRayL.is_colliding() and push_direction == Vector2.RIGHT:
		grav_push = false
		await get_tree().create_timer(0.50).timeout
		free()
	elif pitRayR.is_colliding() and push_direction == Vector2.LEFT:
		grav_push = false
		await get_tree().create_timer(0.50).timeout
		free()
	elif pitRayU.is_colliding() and push_direction == Vector2.DOWN:
		grav_push = false
		await get_tree().create_timer(0.50).timeout
		free()
	elif pitRayD.is_colliding() and push_direction == Vector2.UP:
		grav_push = false
		await get_tree().create_timer(0.50).timeout
		free()
	
	if grav_push:
		move_and_collide(speed * delta)
