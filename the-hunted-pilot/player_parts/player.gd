extends CharacterBody2D

@export var speed : int = 2     #Needs some testing
@export var gravity_orb: PackedScene
@export var reverse_gravity_orb: PackedScene
@export var drill_particle: PackedScene
@export var hex_charge: PackedScene
var screen_size
const TILE_SIZE : int = 64
var initial_position = Vector2.ZERO
var input_direction = Vector2.ZERO
var facing_direction = Vector2.RIGHT
var can_move = true
var can_act = true
var can_fire = true
var current_action = &"idle"
# All possible actions are "idle", "walking", "grav_push", "grav_pull",
#    "drill_start", "drill_ongoing", "drill_end", "hex_charge_toss",
#    "fab", and "blink_knife_toss"
var percent_moved_to_next_tile = 0.0
var reset = false
var player_tools = Array(["gravity_push"],TYPE_STRING, "", null)
# All possible player tools are "gravity_push", "gravity_pull", "drills",
#    "hex_charge", "fabricator", and "blink_knife"
var current_level = "res://levels/level_1.tscn"

@onready var rayR = $RayCastRight
@onready var rayL = $RayCastLeft
@onready var rayD = $RayCastDown
@onready var rayU = $RayCastUp
@onready var dRay = $DeathRay
@onready var sprite = $AnimatedSprite2D

# This is the code to delay actions. Only works on the function it is in
#     does not affect other functions running even in the same object
# await get_tree().create_timer(seconds).timeout

func animate():
	match facing_direction:
		Vector2.RIGHT:
			sprite.rotation_degrees = 0
		Vector2.DOWN:
			sprite.rotation_degrees = 90
		Vector2.LEFT:
			sprite.rotation_degrees = 180
		Vector2.UP:
			sprite.rotation_degrees = 270
	sprite.play(current_action)
		
func idling():
	await get_tree().create_timer(0.5).timeout
	if can_act:
		current_action = &"idle"

func process_player_input():    #Processes all inputs, movement and shooting	
	if input_direction.y == 0:    #Gets the x direction
		input_direction.x = int(Input.get_action_strength("d_right")) - int(Input.get_action_strength("a_left"))
	if input_direction.x == 0:    #Gets the y direction
		input_direction.y = int(Input.get_action_strength("s_down")) - int(Input.get_action_strength("w_up"))
	
	if input_direction != Vector2.ZERO:
		if input_direction == facing_direction:
			if !collision(input_direction): #Checks for collision before moving
				initial_position = position
				can_act = false
				current_action = &"walking"
		else:
			facing_direction = input_direction #Changing direction for the purpose of models and shooting
			match input_direction:
				Vector2.RIGHT:
					sprite.rotation_degrees = 0
				Vector2.DOWN:
					sprite.rotation_degrees = 90
				Vector2.LEFT:
					sprite.rotation_degrees = 180
				Vector2.UP:
					sprite.rotation_degrees = 270
			can_move = false
			can_act = false
			await get_tree().create_timer(0.1).timeout  #This doesn't lock you out of other actions
			can_move = true
			can_act = true
		
	if Input.is_action_just_pressed("r_key"):
		reset = true
	
	if Input.is_action_just_pressed("click"):
		can_act = false
		can_move = false
		current_action = &"grav_push"
		await get_tree().create_timer(0.5).timeout  #This doesn't lock you out of other actions
		gravity_fire(facing_direction)
		await get_tree().create_timer(0.25).timeout  #This doesn't lock you out of other actions
		current_action = &"idle"
		can_act = true
		can_move = true
		
	elif Input.is_action_just_pressed("right_click") and player_tools.has("gravity_pull"):
		can_act = false
		can_move = false
		current_action = &"grav_pull"
		await get_tree().create_timer(0.5).timeout  #This doesn't lock you out of other actions
		reverse_gravity_fire(facing_direction)
		await get_tree().create_timer(0.25).timeout  #This doesn't lock you out of other actions
		current_action = &"idle"
		can_act = true
		can_move = true
	
	elif Input.is_action_just_pressed("e_key") and player_tools.has("drills"):
		can_act = false
		can_move = false
		current_action = &"drill"
		await get_tree().create_timer(0.5).timeout
		drill(facing_direction)
		await get_tree().create_timer(1).timeout
		current_action = &"idle"
		can_act = true
		can_move = true
	
	elif Input.is_action_just_pressed("f_key") and player_tools.has("hex_charge"):
		can_act = false
		can_move = false
		current_action = &"hex_charge_toss"
		await get_tree().create_timer(0.5).timeout
		hex_charge_toss(facing_direction)
		await get_tree().create_timer(0.375).timeout
		current_action = &"idle"
		can_act = true
		can_move = true

func move(delta):
	percent_moved_to_next_tile += speed*delta
	if percent_moved_to_next_tile >= 1.0:   #If you overshoot, corrects your position to the center of the tile
		position = initial_position + (TILE_SIZE * input_direction)
		percent_moved_to_next_tile = 0
		can_act = true
		idling()
	else:
		position = initial_position + (TILE_SIZE * input_direction * percent_moved_to_next_tile)
		can_act = false

func collision(direction):
	match direction:
		Vector2.RIGHT:
			if rayR.is_colliding():
				return true
		Vector2.LEFT:
			if rayL.is_colliding():
				return true
		Vector2.DOWN:
			if rayD.is_colliding():
				return true
		Vector2.UP:
			if rayU.is_colliding():
				return true
		_:
			return false
	return false

func death_check():
	if dRay.is_colliding():
		reset = true
	if reset:
		get_tree().change_scene_to_file(current_level)

func gravity_fire(direction: Vector2):
	var orb = gravity_orb.instantiate()
	get_parent().add_child(orb)
	orb.position = position + direction * 32
	orb.direction = direction

func reverse_gravity_fire(direction: Vector2):
	var reverse_orb = reverse_gravity_orb.instantiate()
	get_parent().add_child(reverse_orb)
	reverse_orb.position = position + direction * 32
	reverse_orb.direction = direction

func drill(direction: Vector2):
	var drill_effect = drill_particle.instantiate()
	get_parent().add_child(drill_effect)
	drill_effect.position = position + direction * 32
	drill_effect.direction = direction
	await get_tree().create_timer(0.75).timeout
	drill_effect.free()

func hex_charge_toss(direction: Vector2):
	var hex_charge = hex_charge.instantiate()
	get_parent().add_child(hex_charge)
	hex_charge.position = position + direction * 64
	hex_charge.direction = direction

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	initial_position = position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	animate()
	death_check()
	if can_act:
		process_player_input()
	elif input_direction != Vector2.ZERO and can_move:
		move(delta)
	elif reset:
		pass     # I don't know yet if I should put the code to reset the level here or on each level
	else:
		pass

#This bit of code caused an error but I don't know what it does so I haven't deleted it yet
#position = position.clamp(Vector2.ZERO, screen_size)
