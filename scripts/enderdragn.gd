extends CharacterBody2D
@onready var rotation_node: Node2D = $rotationNode
@onready var animated_sprite_2d: AnimatedSprite2D = $rotationNode/AnimatedSprite2D
@onready var dragonballstartmark: Marker2D = $rotationNode/AnimatedSprite2D/dragonballstartmark
@onready var animation_player: AnimationPlayer = $CollisionShape2D/AnimationPlayer
@onready var dragonhit: AudioStreamPlayer = $dragonhit


@onready var dragondeath: AudioStreamPlayer = $dragondeath
@onready var dragonballthrow: AudioStreamPlayer = $dragonballthrow


const DRAGONBALL = preload("uid://ds8wlxu0w3r04")
var max_health: int = 30
var health: int = max_health

@onready var dragonegg: Sprite2D = $"../dragonegg"

func take_damage(amount):
	health -= amount
	dragonhit.play()

	if health <= 0:
		var message = get_tree().current_scene.get_node("player/Camera2D/message")
		message.show_message("MESSAGE: OHH!!! DRAGON'S DEAD")
		
		dragondeath.play()
		await get_tree().create_timer(7).timeout
		var egg = get_tree().current_scene.get_node("dragonegg")
		egg.visible = true
		isShooting = false
		self.visible = false
		await get_tree().create_timer(5).timeout
		get_tree().change_scene_to_file("res://scenes/the_end.tscn")
		
		
		
		queue_free()
		
		
		

	
		


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
	animated_sprite_2d.play("dragonanimation")
	
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
	if animated_sprite_2d.animation == "dragonanimation":
		if animated_sprite_2d.frame == 6:
			_create_dragonball()
			dragonballthrow.play()
			


func _ready():
	await get_tree().process_frame
	player = get_tree().get_first_node_in_group("player")
	
func _create_dragonball():
	print("shooting dragonball")
	var dragonballnode = DRAGONBALL.instantiate()
	
	var player = get_tree().get_first_node_in_group("player")
	dragonballnode.direction = global_position.direction_to(player.global_position)
	
	get_tree().current_scene.add_child(dragonballnode)
	dragonballnode.global_position = dragonballstartmark.global_position
	


func _on_animated_sprite_2d_animation_finished() -> void:
	if animated_sprite_2d.animation == "dragonanimation":
		isShooting = false
