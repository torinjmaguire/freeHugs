extends Node3D

@export var puzzleGrid: Array

func _init():
	importGrid()

func importGrid():
	var puzzleGridData = preload("res://Resources/W2_push_puzzle.csv")
	puzzleGrid = puzzleGridData.records
