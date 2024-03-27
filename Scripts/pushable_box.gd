extends CharacterBody3D

# Player presses e to interact with nearby object
# Pressing e signals to the nearby object
# Object is pushed if possible in a cardinal direction

# Add interact mechanic to emit signal from player
@export var push_distance = 2
var interactable = false
var player: CharacterBody3D

func _on_area_3d_body_entered(body:Node3D):
	if body.get_name() == "Player":
		player = body
		interactable = true

func _on_area_3d_body_exited(body:Node3D):
	if body.get_name() == "Player":
		interactable = false

func _process(_delta):
	if Input.is_action_just_pressed("interact") and interactable:
		var directionVector = Vector3.ZERO
		var deltaVector = Vector3.ZERO

		deltaVector = player.position - position
		var opposingAxis = deltaVector.abs().max_axis_index()

		directionVector[opposingAxis] = deltaVector[opposingAxis]
		directionVector = directionVector.normalized() * push_distance * -1

		print(deltaVector)
		print(directionVector)

		var tween = create_tween()
		tween.tween_property(self, "position", position + directionVector, 0.3)
