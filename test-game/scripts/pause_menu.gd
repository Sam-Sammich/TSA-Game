extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		pause()

func pause() -> void:
	get_tree().paused = !get_tree().paused
	visible = !visible


func _on_continue_pressed() -> void:
	pause()


func _on_settings_pressed() -> void:
	pass # Replace with function body.


func _on_back_to_title_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://Levels/main_menu.tscn")
