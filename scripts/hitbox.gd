extends Area2D
var health := 12
var health_max := 12
var health_min := 0

@onready var player: = get_parent()
@onready var diamond_label = $"../Camera2D/Label"




func _ready() -> void:
	add_to_group("player")





func get_damage(damage:int):
	health -= damage
	
	var health_ui = get_tree().get_first_node_in_group("health_ui")
	
	if health_ui != null:
		health_ui.set_health(health)
	if health <= 0:
		get_tree().change_scene_to_file("res://scenes/game.tscn")
		






func _on_area_entered(area):
	if area.is_in_group("diamond"):
		
		player.diamond_counter += 1
		GameManager.diamonds = player.diamond_counter
		
		area.queue_free()
		diamond_label.text = "diamond: " + str(player.diamond_counter)
	if area.is_in_group("blaze"):
		print("in")
		
		player.blaze_counter += 1
		GameManager.blaze = player.blaze_counter
		print(GameManager.blaze)
		area.queue_free()
	

	
