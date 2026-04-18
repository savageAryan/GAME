extends CharacterBody2D
@onready var rotation_node: Node2D = $rotationNode
@onready var fireballstartmark: Marker2D = $rotationNode/fireballstartmark
@onready var animated_sprite_2d: AnimatedSprite2D = $rotationNode/AnimatedSprite2D

@onready var blazefiring: AudioStreamPlayer2D = $"../player/Camera2D/blazefiring"



const FIREBALL = preload("uid://dyrousjidr0v1")


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var player = null

var isShooting = false


func _physics_process(delta: float) -> void:

	if not isShooting:
		_shoot()
	

	
	if isShooting:
		return
	
	


	move_and_slide()
	
func _shoot():
	isShooting = true
	animated_sprite_2d.play("blazeanimation")
	
func _set_animation():
	var player = get_tree().get_first_node_in_group("player")
	
	if not player : return
	
	var playerposition = player.global_position
	var direction = global_position.direction_to(playerposition)
	
	if direction.x > 0:
		rotation_node.scale.x = 1
	
	elif direction.x < 0:
		rotation_node.scale.x = -1


func _on_animated_sprite_2d_frame_changed() -> void:
	if animated_sprite_2d.animation == "blazeanimation":
		if animated_sprite_2d.frame == 6:
			_create_fireball()
			blazefiring.play()
			


func _ready():
	await get_tree().process_frame
	player = get_tree().get_first_node_in_group("player")
	
func _create_fireball():
	
	var fireballnode = FIREBALL.instantiate()
	
	var player = get_tree().get_first_node_in_group("player")
	fireballnode.direction = global_position.direction_to(player.global_position)
	
	get_tree().current_scene.add_child(fireballnode)
	fireballnode.global_position = fireballstartmark.global_position
	


func _on_animated_sprite_2d_animation_finished() -> void:
	if animated_sprite_2d.animation == "blazeanimation":
		isShooting = false
