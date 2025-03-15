extends Node2D

@onready var timer: Timer = $Killzone/Timer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	position.y += 50 * delta
	


func _on_killzone_body_entered(body: Node2D) -> void:
	if !body.is_in_group("Player"):
		hide()
		if Engine.time_scale == 1:
			queue_free()
		
