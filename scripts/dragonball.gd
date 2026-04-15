
extends Area2D

@onready var sprite_2d: Sprite2D = $Sprite2D


var direction:Vector2
var speed = 600.0


func _ready() -> void:
	get_tree().create_timer(4).timeout.connect(queue_free)

func _physics_process(delta: float) -> void:
	if direction:
		global_position += direction * speed * delta
		look_at(global_position + direction)





func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):
		area.get_damage(3)
		
	queue_free()
	
