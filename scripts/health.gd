extends Panel

var health = 12
@onready var hearts = $HBoxContainer.get_children()
func _ready():
	add_to_group("health_ui")

func update_hearts():
	for i in range(hearts.size()):
		hearts[i].visible = i < health
		
func set_health(value):
	health = clamp(value, 0, hearts.size())
	update_hearts()
