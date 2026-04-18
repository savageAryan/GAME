
extends Area2D

@onready var sprite_2d: Sprite2D = $Sprite2D


var direction:Vector2
var speed = 1000


func _ready() -> void:
	get_tree().create_timer(10).timeout.connect(queue_free)

func _physics_process(delta: float) -> void:
	position += direction * speed * delta





func _on_body_entered(body):
	if body.is_in_group("dragon"):
		body.take_damage(2)
		print("hit dragon")
		
		queue_free()
	
