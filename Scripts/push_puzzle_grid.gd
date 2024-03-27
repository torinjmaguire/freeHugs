extends Resource

@export var grid: Array

func initialize_grid(height: int, width: int):
	for x in height:
		grid.append(Array())
		grid[x].resize(width)
		grid[x].fill(0)

func print():
	for x in grid:
		print(x)
