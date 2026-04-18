extends Sprite2D

@onready var dragonegg: Sprite2D = $"."

func _on_area_2d_area_entered(area: Area2D) -> void:

		if area.is_in_group("player"):
			
			
			var message = get_tree().current_scene.get_node("player/Camera2D/message")
			message.show_message("MESSAGE: WOW! a Dragon egg, IT's SHAKING!!!")
