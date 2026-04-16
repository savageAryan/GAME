extends Node2D
var diamonds = 0
var blaze = 0

@onready var pause_menu: Control = $"../CharacterBody2D/Camera2D/PauseMenu"
func _ready():
	var message = get_tree().current_scene.get_node("CharacterBody2D/Camera2D/message")
	message.show_message("MESSAGE: WELOCOME!!Home , beat the game! (hint:Nether = lava, End = Ice)")
