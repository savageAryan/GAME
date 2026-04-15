extends Area2D



func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):
		
	
		print("playerisinportal")
		if GameManager.blaze >= 6:
		
		
			get_tree().change_scene_to_file("res://scenes/nether.tscn")
