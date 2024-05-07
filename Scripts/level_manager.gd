extends Node

const levelPaths = {
	mainMenu = "res://Scenes/main_menu.tscn",
	warehouse1 = "res://Scenes/warehouse_1.tscn"
}

func switchLevel(newLevel):
	self.get_tree().change_scene_to_file(newLevel)
