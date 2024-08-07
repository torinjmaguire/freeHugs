extends Area3D

func _on_body_entered(_body: CharacterBody3D) -> void:
	self.queue_free()
