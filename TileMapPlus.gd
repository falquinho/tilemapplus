tool
extends TileMap

const adj_cells = [
	Vector2(1, 1),
	Vector2(0, 1),
	Vector2(-1, 1),
	Vector2(1, 0),
	Vector2(-1, 0),
	Vector2(1, -1),
	Vector2(0, -1),
	Vector2(-1, -1),
]

export var add_rule_on_draw = false
export var apply_rules_on_draw = false
export var allow_erase_rules = false

export var ruleset = {}

func _enter_tree():
	connect("draw", self, "on_draw")
	pass

func on_draw():

	if add_rule_on_draw:
		add_rule()
		pass

	if apply_rules_on_draw:
		apply_rules()
		pass
	pass
	
func add_rule():
	var cell = get_drawn_cell()
	if get_cellv(cell) == -1 and !allow_erase_rules:
		return
		
	var key = compute_adj_state(cell)
	var cell_state = get_cell_state(cell)
	ruleset[key] = cell_state
	pass

func apply_rules():
	var used_cells = get_used_cells()
	for cell in used_cells:
		var adj_state = compute_adj_state(cell)
		if ruleset.has(adj_state):
			set_cellv(
				cell,
				ruleset[adj_state][0],
				ruleset[adj_state][1],
				ruleset[adj_state][2],
				ruleset[adj_state][3]
			)
			pass
		pass
	pass

func get_cell_state(cell):
	var state = [
		get_cellv(cell),
		is_cell_x_flipped(cell.x, cell.y),
		is_cell_y_flipped(cell.x, cell.y),
		is_cell_transposed(cell.x, cell.y)
	]
	return state
	pass

func compute_adj_state(cell):
	var mask = 1
	var state = 0

	for adj in adj_cells:
		if get_cellv(cell+adj) != -1:
			state = state | mask
			pass
		mask = mask << 1
		pass

	return state
	pass

func get_drawn_cell():
	var mouse_pos = get_viewport().get_mouse_position()
	return world_to_map(mouse_pos)
	pass