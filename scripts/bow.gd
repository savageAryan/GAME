extends CharacterBody2D
@onready var fire_point: Marker2D = $rotationNode/FirePoint

const ARROW = preload("uid://bf5itho3pco6l")

var can_shoot = true
var shoot_delay = 0.5

func _process(delta):
		
	var mouse_pos = get_global_mouse_position()
	var dir = mouse_pos - global_position
	rotation = dir.angle()
	
	
	if Input.is_action_pressed("shoot") and can_shoot:
		shoot()
		
func shoot():
	can_shoot = false
	var arrow = ARROW.instantiate()
	
	var mouse_pos = get_global_mouse_position()
	var dir = (fire_point.global_position - mouse_pos).normalized()
	arrow.rotation = dir.angle() + deg_to_rad(180)
	arrow.direction = dir 
	arrow.global_position = fire_point.global_position
	get_tree().current_scene.add_child(arrow)
	await get_tree().create_timer(shoot_delay).timeout
	can_shoot = true
	
