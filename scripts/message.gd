extends Panel

@onready var label: Label = $Label

func show_message(text):
	visible = true
	print("message called")
	label.text = text
	
	
	await get_tree().create_timer(9.0).timeout
	visible = false
	

	
