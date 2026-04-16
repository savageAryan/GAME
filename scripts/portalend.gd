extends Area2D



func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"): 
		print("playerisinportal")
		if GameManager.blaze >= 6:
		
		
			get_tree().change_scene_to_file("res://scenes/end.tscn")
		else:
			var message = get_tree().current_scene.get_node("CharacterBody2D/Camera2D/message")
			message.show_message("MESSAGE: need 6 blazerods")
		
