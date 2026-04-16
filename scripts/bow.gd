extends CharacterBody2D
@onready var fire_point: Marker2D = $rotationNode/FirePoint

const ARROW = preload("uid://bf5itho3pco6l")


func _process(delta):
		
	var mouse_pos = get_global_mouse_position()
	var dir = mouse_pos - global_position
	rotation = dir.angle()
	if Input.is_action_just_pressed("shoot"):
		shoot()
		
func shoot():
	var arrow = ARROW.instantiate()
	
	var mouse_pos = get_global_mouse_position()
	var dir = (mouse_pos - fire_point.global_position).normalized()
	
	arrow.direction = dir 
	arrow.global_position = fire_point.global_position
	get_tree().current_scene.add_child(arrow)
