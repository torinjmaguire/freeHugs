extends Node


const MAIN_MENU_PATH = "res://Scenes/main_menu.tscn"
const WAREHOUSE_1_PATH = "res://Scenes/warehouse_1.tscn"

func switchLevel(newLevel):
	self.get_tree().change_scene_to_file(newLevel)
