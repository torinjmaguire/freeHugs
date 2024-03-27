extends Node3D

@export var puzzleGrid: Resource

func _ready():
	puzzleGrid.initialize_grid(10, 10)
