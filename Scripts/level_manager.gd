extends Node

func switchLevel(newLevel):
	self.get_tree().call_deferred("change_scene_to_file", newLevel)
