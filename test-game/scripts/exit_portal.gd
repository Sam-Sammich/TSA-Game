extends Area2D



func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		var current_scene = get_tree().current_scene.scene_file_path
		
		var next_level_num = int(current_scene)+1
		get_tree().change_scene_to_file("res://Levels/level_"+ str(next_level_num) +".tscn")
 
