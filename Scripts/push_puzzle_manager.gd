extends Node3D

@export var puzzle_data_path: Resource
var puzzle_data
var puzzle_height
var puzzle_width

func _ready():
	puzzle_data = load(puzzle_data_path.resource_path).records
	puzzle_height = puzzle_data.size()
	puzzle_width = puzzle_data[0].size()
	
func is_space_occupied(x, y):
	if puzzle_data[x][y] == 1:
		return true
	else:
		return false
