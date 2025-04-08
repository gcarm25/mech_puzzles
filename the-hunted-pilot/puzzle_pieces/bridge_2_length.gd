extends StaticBody2D

var is_extended = false
var moving = false
@onready var PowRay = $PowerDetector
@onready var s_1 = $segment_1
@onready var s_2 = $segment_2
@onready var c_1 = $segment_1_collision
@onready var c_2 = $segment_2_collision

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if PowRay.is_colliding() and !is_extended and !moving:
		print("bridge is powered")
		moving = true
		s_1.play(&"moving_1")
		s_2.play(&"moving_3")
		c_1.disabled = false
		s_1.visible = true
		await get_tree().create_timer(0.5).timeout
		c_2.disabled = false
		s_2.visible = true
		await get_tree().create_timer(0.5).timeout
		is_extended = true
		moving = false
	elif PowRay.is_colliding() and is_extended:
		s_1.pause()
		s_2.pause()
	elif !PowRay.is_colliding() and is_extended and !moving:
		moving = true
		s_1.play(&"moving_1",1,true)
		s_2.play(&"moving_3",1,true)
		await get_tree().create_timer(0.5).timeout
		c_2.disabled = true
		s_2.visible = false
		await get_tree().create_timer(0.5).timeout
		c_1.disabled = true
		s_1.visible = false
		is_extended = false
		moving = false
	elif !moving:
		c_1.disabled = true
		c_2.disabled = true
		s_1.visible = false
		s_2.visible = false
