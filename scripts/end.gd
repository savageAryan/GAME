extends Node2D
@onready var message: Panel = $player/Camera2D/message
func _ready():
	var message = get_tree().current_scene.get_node("player/Camera2D/message")
	message.show_message("MESSAGE: ohh cold! , is that a Dragon?? (hint:USE BOW, HOLD CTRL + LMB)")
