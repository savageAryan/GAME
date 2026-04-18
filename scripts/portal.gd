extends Area2D


@onready var nethergo: AudioStreamPlayer = $nethergo

func _on_area_entered(area):
	
	if area.is_in_group("player"): 
		if GameManager.diamonds >= 20:
			nethergo.play()
			await nethergo.finished
		
		
			get_tree().change_scene_to_file("res://scenes/nether.tscn")
		else:
			var message = get_tree().current_scene.get_node("CharacterBody2D/Camera2D/message")
			message.show_message("MESSAGE: need 20 diamonds")
		
