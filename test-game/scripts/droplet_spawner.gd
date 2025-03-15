extends Node2D

const WATER_DROPLET := preload("res://scenes/water_droplet.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	add_child(WATER_DROPLET.instantiate())
