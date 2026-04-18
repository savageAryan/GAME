extends Control

@onready var babyvoice: AudioStreamPlayer2D = $babyvoice
@onready var button: Button = $Button

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	babyvoice.play()
	await get_tree().create_timer(7).timeout
	button.visible = true


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/control.tscn")
