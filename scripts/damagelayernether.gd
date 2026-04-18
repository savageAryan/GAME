extends TileMapLayer

var mining_progress := 0.0
var mining_time := 0.5
var current_tile := Vector2i(-1, -1)
@onready var place: AudioStreamPlayer = $place
@onready var break_1: AudioStreamPlayer = $break1

const DIAMOND = preload("uid://xqjxvxnbggem")

@onready var cracks: TileMapLayer = $"../Cracks"



func spawn_diamond(tile_pos):
	var diamond = DIAMOND.instantiate()
	var world_pos = map_to_local(tile_pos)
	diamond.global_position = to_global(world_pos)
	get_tree().current_scene.add_child(diamond)


func reset_crack():
	cracks.clear()


func update_crack(tile_pos):
	var stage = int((mining_progress / mining_time) * 9)
	stage = clamp(stage, 0, 9)

	cracks.set_cell(tile_pos, 0, Vector2i(stage, 15))


func break_tile(tile_pos):
	var source_id = get_cell_source_id(tile_pos)
	var atlas_coords = get_cell_atlas_coords(tile_pos)

	
	if source_id == 0 and atlas_coords == Vector2i(2, 3):
		spawn_diamond(tile_pos)

	set_cell(tile_pos, -1)
	reset_crack()


func _process(delta):

	var mouse_pos = get_global_mouse_position()
	var local_mouse = to_local(mouse_pos)
	var tile_pos = local_to_map(local_mouse)

	
	if Input.is_action_just_pressed("place"):
		place.play()
		set_cell(tile_pos, 0, Vector2i(2, 0))


	if Input.is_action_pressed("destroy"):
		
		var source_id = get_cell_source_id(tile_pos)
		
		if source_id == -1:
			reset_crack()
			return

		if tile_pos != current_tile:
			reset_crack()
			mining_progress = 0
			current_tile = tile_pos

		mining_progress += delta
		update_crack(tile_pos)

		if mining_progress >= mining_time:
			break_tile(tile_pos)
			mining_progress = 0
			break_1.play()

	else:
		reset_crack()
		mining_progress = 0
