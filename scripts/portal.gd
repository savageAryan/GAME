extends Area2D



func _on_area_entered(area):
	

	
	
	if area.is_in_group("player"): 
		print("playerisinportal")
		if GameManager.diamonds >= 20:
		
		
			get_tree().change_scene_to_file("res://scenes/nether.tscn")
	else:
		print("need20dia")
