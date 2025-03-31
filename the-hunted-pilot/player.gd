extends CharacterBody2D

@export var speed : int = 2     #Needs some testing
@export var gravity_orb: PackedScene
var screen_size
const TILE_SIZE : int = 64
var initial_position = Vector2.ZERO
var input_direction = Vector2.ZERO
var facing_direction = Vector2.RIGHT
var is_moving = false
var can_fire = true
var percent_moved_to_next_tile = 0.0
const inputs = {
	"up_arrow": Vector2.UP,
	"down_arrow": Vector2.DOWN,
	"right_arrow": Vector2.RIGHT,
	"left_arrow": Vector2.LEFT
}
@onready var rayR = $RayCastRight
@onready var rayL = $RayCastLeft
@onready var rayD = $RayCastDown
@onready var rayU = $RayCastUp

#func wait(seconds: float) -> void:
#	await get_tree().create_timer(seconds).timeout
# This function doesn't work, but the line of code in it does?
# Any time you need a delay, use it I guess


func process_player_input():    #Processes all inputs, movement and shooting
	if input_direction.y == 0:    #Gets the x direction
		input_direction.x = int(Input.get_action_strength("d_right")) - int(Input.get_action_strength("a_left"))
	if input_direction.x == 0:    #Gets the y direction
		input_direction.y = int(Input.get_action_strength("s_down")) - int(Input.get_action_strength("w_up"))
	
	if input_direction != Vector2.ZERO:
		facing_direction = input_direction #Changing direction for the purpose of models and shooting
		if !collision(input_direction): #Checks for collision before moving
			initial_position = position
			is_moving = true
	
	if Input.is_action_just_pressed("click"):
		if can_fire:
			can_fire = false
			gravity_fire(facing_direction)
			await get_tree().create_timer(1.25).timeout  #This doesn't lock you out of other actions
			can_fire = true

func move(delta):
	percent_moved_to_next_tile += speed*delta
	if percent_moved_to_next_tile >= 1.0:   #If you overshoot, corrects your position to the center of the tile
		position = initial_position + (TILE_SIZE * input_direction)
		percent_moved_to_next_tile = 0
		is_moving = false
	else:
		position = initial_position + (TILE_SIZE * input_direction * percent_moved_to_next_tile)

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

func gravity_fire(direction: Vector2):
	var orb = gravity_orb.instantiate()
	get_parent().add_child(orb)
	orb.position = position + direction * 32
	orb.direction = direction

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	initial_position = position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_moving == false:
		process_player_input()
	elif input_direction != Vector2.ZERO:
		move(delta)
	else:
		is_moving = false

#This bit of code caused an error but I don't know what it does so I haven't deleted it yet
#position = position.clamp(Vector2.ZERO, screen_size)
