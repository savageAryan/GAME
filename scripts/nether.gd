extends Node2D

@onready var pause_menu: Control = $player/Camera2D/PauseMenu


var paused = false
@onready var innether: AudioStreamPlayer = $innether

func _ready():
	var player = get_tree().get_first_node_in_group("player")
	
	innether.play()
	var message = get_tree().current_scene.get_node("player/Camera2D/message")
	message.show_message("MESSAGE: HUH!!! I NEED 6 BLAZE RODS (Hint: loot 3 Fortress rooms)")
