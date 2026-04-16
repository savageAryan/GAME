extends Area2D

@onready var camera_2d: Camera2D = $"../player/Camera2D"


func _on_area_entered(area: Area2D) -> void:
		if area.is_in_group("player"):
			print("player in")
			camera_2d.zoom/2
	
	
