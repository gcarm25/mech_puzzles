extends Node2D

@onready var player = $Player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.player_tools += ["gravity_pull", "drills","hex_charge", "fabricator", "blink_knife"]
	player.current_level = "res://levels/Testing_Level.tscn"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
