extends TileMapLayer







func _process(delta):
	if (Input.is_action_just_pressed("pause")):
		get_tree().paused = true
		$pause_menu.visible = true
		
	
	
	var mouse_pos = get_global_mouse_position()
	var tile = local_to_map(to_local(mouse_pos))
	if (Input.is_action_just_pressed("place")):
		
		set_cell(tile, 0, Vector2i(2 ,0))
	if (Input.is_action_just_pressed("destroy")):
		set_cell(tile, 0, Vector2i(-1 ,-1))
	
