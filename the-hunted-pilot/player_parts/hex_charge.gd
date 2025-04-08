extends StaticBody2D
@onready var butCollision = $ButtonCollision
@onready var expCollision = $ExplosionCollision
@onready var butAnim = $ButtonSprite
@onready var expAnim = $ExplosionSprite
@onready var detRay = $RayCast2D
@onready var bloRay = $BlockingRay

var direction = Vector2.ZERO
var initial_position = position
var armed = false
var should_explode = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if !armed:
		match direction:
			Vector2.RIGHT:
				butAnim.play(&"right_explosive")
			Vector2.DOWN:
				butAnim.play(&"bottom_explosive")
			Vector2.LEFT:
				butAnim.play(&"left_explosive")
			Vector2.UP:
				butAnim.play(&"top_explosive")
			_:
				butAnim.play(&"right_explosive")
		await get_tree().create_timer(.5).timeout
		if bloRay.is_colliding():
			free()
		else:
			butAnim.play(&"arming")
			await get_tree().create_timer(.75).timeout
			butAnim.play(&"armed")
			armed = true
			show_behind_parent = true
	else:
		if should_explode:
			butAnim.play(&"exploding")
			await get_tree().create_timer(.5).timeout
			butCollision.disabled = false
			expAnim.play(&"big_explosion")
			show_behind_parent = false
			await get_tree().create_timer(.25).timeout
			butAnim.play(&"default")
			butCollision.disabled = true
			expCollision.disabled = false
			await get_tree().create_timer(.625).timeout
			expCollision.disabled = true
			expAnim.play(&"default")
			free()
		else:
			butAnim.play(&"armed")
			if detRay.is_colliding():
				print("explode")
				should_explode = true


#extends StaticBody2D
#@onready var explosion = $CollisionShape2D
#@onready var anim = $Sprite2D
#var exploding = false
#var direction = Vector2.ZERO
#var initial_position = position

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#if exploding:
		#position = initial_position
		#match direction:
			#Vector2.RIGHT:
				#anim.play(&"right_explosive")
				#await get_tree().create_timer(.75).timeout
				#explosion.disabled = false
				#await get_tree().create_timer(.25).timeout
				#free()
			#Vector2.DOWN:
				#anim.play(&"bottom_explosive")
				#await get_tree().create_timer(.75).timeout
				#explosion.disabled = false
				#await get_tree().create_timer(.25).timeout
				#free()
			#Vector2.LEFT:
				#anim.play(&"left_explosive")
				#await get_tree().create_timer(.75).timeout
				#explosion.disabled = false
				#await get_tree().create_timer(.25).timeout
				#free()
			#Vector2.UP:
				#anim.play(&"top_explosive")
				#await get_tree().create_timer(.75).timeout
				#explosion.disabled = false
				#await get_tree().create_timer(.25).timeout
				#free()
			#_:
				#pass
