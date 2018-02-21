extends Resource

var rules = {}

func add_rule(adj_state, cell_state):
	rules[adj_state] = cell_state
	pass
