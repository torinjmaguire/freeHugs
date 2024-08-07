extends Node

func switchLevel(newLevel: String) -> void:
	self.get_tree().call_deferred("change_scene_to_file", newLevel)
