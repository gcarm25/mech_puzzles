extends StaticBody2D

@onready var collisionShape = $CollisionShape2D
@onready var anim = $Sprite2D
@onready var rays = $Rays
@onready var ExpRay = $Rays/ExpRay
@onready var pitRay = $Rays/PitRay
@onready var gravRayL = $Rays/GravityDetectorL
@onready var gravRayR = $Rays/GravityDetectorR
@onready var gravRayU = $Rays/GravityDetectorU
@onready var gravRayD = $Rays/GravityDetectorD
@onready var RgravRayL = $Rays/ReverseGravityDetectorL
@onready var RgravRayR = $Rays/ReverseGravityDetectorR
@onready var RgravRayU = $Rays/ReverseGravityDetectorU
@onready var RgravRayD = $Rays/ReverseGravityDetectorD
@onready var colRayL = $Rays/CollisionDetectorL
@onready var colRayR = $Rays/CollisionDetectorR
@onready var colRayU = $Rays/CollisionDetectorU
@onready var colRayD = $Rays/CollisionDetectorD
var initial_position = position
const TILE_SIZE = 64
var grav_push = false
var push_direction = Vector2.RIGHT
var speed = 4
var percent_moved_to_next_tile = 0
var collision_checked = false
func _ready() -> void:
	initial_position = position

# Called when the node enters the scene tree for the first time.
func halting_collision():
	match push_direction:
		Vector2.RIGHT:
			if colRayR.is_colliding():
			#	print("collide_right")
				return true
		Vector2.LEFT:
			if colRayL.is_colliding():
			#	print("collide_left")
				return true
		Vector2.DOWN:
			if colRayD.is_colliding():
			#	print("collide_down")
				return true
		Vector2.UP:
			if colRayU.is_colliding():
			#	print("collide_up")
				return true
		_:
			return false
	return false

func activation_collision(delta):
	if gravRayL.is_colliding() or RgravRayR.is_colliding():
		push_direction = Vector2.RIGHT
		speed = 4
		await get_tree().create_timer(0.25).timeout
		if !halting_collision():
			grav_push = true
	elif gravRayR.is_colliding() or RgravRayL.is_colliding():
		push_direction = Vector2.LEFT
		speed = 4
		await get_tree().create_timer(0.25).timeout
		if !halting_collision():
			grav_push = true
	elif gravRayU.is_colliding() or RgravRayD.is_colliding():
		push_direction = Vector2.DOWN
		speed = 4
		await get_tree().create_timer(0.25).timeout
		if !halting_collision():
			grav_push = true
	elif gravRayD.is_colliding()  or RgravRayU.is_colliding():
		push_direction = Vector2.UP
		speed = 4
		await get_tree().create_timer(0.25).timeout
		if !halting_collision():
			grav_push = true
		
	if pitRay.is_colliding() and !grav_push:
		collisionShape.disabled = true
		anim.play(&"falling")
		await get_tree().create_timer(0.75).timeout
		anim.play(&"in_pit")
		show_behind_parent = true
	elif ExpRay.is_colliding():
		anim.play(&"despawning")
		await get_tree().create_timer(1).timeout
		free()
		
func move(delta):
	if !collision_checked:
		if !halting_collision():
			grav_push = false
		collision_checked = true
	else:
		percent_moved_to_next_tile += speed*delta
		if percent_moved_to_next_tile >= 1.0:   #If you overshoot, corrects your position to the center of the tile
			position = initial_position + (TILE_SIZE * push_direction)
			percent_moved_to_next_tile = 0
			initial_position = position
			grav_push = false
			collision_checked = false
		else:
			position = initial_position + (TILE_SIZE * push_direction * percent_moved_to_next_tile)
		#	print("move")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !grav_push and !collisionShape.disabled:
		activation_collision(delta)
	elif grav_push:
		move(delta)
	#	print("case 2")

func correct_position():
	if int(position.x) % 64 > 32:
		position.x = position.x - (int(position.x) % 64) + 64
	else:
		position.x = position.x - (int(position.x) % 64)
	if int(position.y) % 64 > 32:
		position.y = position.y - (int(position.y) % 64) + 64
	else:
		position.y = position.y - (int(position.y) % 64)

# *Sigh* Okay, it's time to copy the player code

#func _process(delta: float) -> void:
	#animate()
	#death_check()
	#if can_act:
		#process_player_input()
	#elif input_direction != Vector2.ZERO and can_move:
		#move(delta)
	#else:
		#pass
