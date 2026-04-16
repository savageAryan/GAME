extends Area2D
@onready var message: Panel = $"../player/Camera2D/message"



func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):
		
	
		print("playerisinportal")
		if GameManager.blaze >= 6:
			get_tree().change_scene_to_file("res://scenes/game.tscn")
		else:
			var message = get_tree().current_scene.get_node("player/Camera2D/message")
			message.show_message("MESSAGE: need 6 blazerods")
		
