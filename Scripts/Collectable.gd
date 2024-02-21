extends Area3D

func _on_body_entered(body):
	self.queue_free()
