extends Node2D

@onready var player = $Player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.current_level = "res://levels/level_1.tscn"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
