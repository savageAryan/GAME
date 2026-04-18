extends Node2D
@onready var endambient: AudioStreamPlayer = $endambient
@onready var message: Panel = $player/Camera2D/message
@onready var enderdragon: CharacterBody2D = $enderdragon
func _ready():
	var message = get_tree().current_scene.get_node("player/Camera2D/message")
	message.show_message("MESSAGE: ohh cold! , is that a Dragon?? (hint:USE BOW, HOLD CTRL + LMB)")
	endambient.play()
	
