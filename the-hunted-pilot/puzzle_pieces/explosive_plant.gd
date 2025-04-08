extends StaticBody2D
@onready var uRay = $DetRay0
@onready var rRay = $DetRay1
@onready var dRay = $DetRay2
@onready var lRay = $DetRay3
@onready var iRay = $DetRay4
@onready var anim = $Sprite2D
@export var explosive_plant_bud: PackedScene
@onready var right_bud = explosive_plant_bud.instantiate()
@onready var down_bud = explosive_plant_bud.instantiate()
@onready var left_bud = explosive_plant_bud.instantiate()
@onready var up_bud = explosive_plant_bud.instantiate()


func _ready():
	add_child(right_bud)
	add_child(down_bud)
	add_child(left_bud)
	add_child(up_bud)
	
	right_bud.initial_position.x += 64
	right_bud.direction = Vector2.RIGHT
	down_bud.initial_position.y += 64
	down_bud.direction = Vector2.DOWN
	left_bud.initial_position.x -= 64
	left_bud.direction = Vector2.LEFT
	up_bud.initial_position.y -= 64
	up_bud.direction = Vector2.UP


func detonate():
	anim.play("exploding")
	await get_tree().create_timer(1).timeout
	right_bud.exploding = true
	down_bud.exploding = true
	left_bud.exploding = true
	up_bud.exploding = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if uRay.is_colliding():
		detonate()
		await get_tree().create_timer(2).timeout
		free()
	elif rRay.is_colliding():
		detonate()
		await get_tree().create_timer(2).timeout
		free()
	elif dRay.is_colliding():
		detonate()
		await get_tree().create_timer(2).timeout
		free()
	elif lRay.is_colliding():
		detonate()
		await get_tree().create_timer(2).timeout
		free()
	elif iRay.is_colliding():
		detonate()
		await get_tree().create_timer(2).timeout
		free()
