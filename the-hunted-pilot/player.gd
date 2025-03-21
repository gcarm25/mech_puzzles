extends CharacterBody2D

@export var speed = 100
var screen_size


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var velocity = Vector2.ZERO
	var lastInput = 1 #Move Right: 1, Move Left: 2, Move Down: 3, Move Up: 4
	#match Input:  #Maybe use to improve runtime calculations?
	if Input.is_action_pressed("right_arrow"):
		#position.x += 64
		velocity.x = 64*4       #This uses = instead of += so that you always move at 
		velocity.y = 0        #a constant speed and you can only move in one direction at a time
		lastInput = 1   #This was my first attempt at correcting for collision, may still have a use
	if Input.is_action_pressed("left_arrow"):
		#position.x -= 64
		velocity.x = -64*4
		velocity.y = 0
		lastInput = 2
	if Input.is_action_pressed("down_arrow"):
		#position.y += 64
		velocity.x = 0
		velocity.y = 64*4
		lastInput = 3
	if Input.is_action_pressed("up_arrow"):
		#position.y -= 64
		velocity.x = 0
		velocity.y = -64*4
		lastInput = 4
	
	#Keeping this here as an example of how to do a match statement
		#match lastInput:
			 #1:
				#position.x -= 64
			 #2:
				#position.x += 64
			 #3:
				#position.y -= 64
			 #4:
				#position.y += 64
		#velocity = velocity.rotated(PI)
	
	move_and_collide(velocity*delta)
	#position = position.clamp(Vector2.ZERO, screen_size)
	#This bit of code caused an error but I don't know what it does so I haven't deleted it yet
