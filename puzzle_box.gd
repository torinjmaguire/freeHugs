extends CharacterBody3D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	move_and_slide()

func pushed(pusherPosition):
	if !scale.is_equal_approx(Vector3(1,1,1)):
		return
	
	var differential = position-pusherPosition
	var maxAxisIndex = differential.abs().max_axis_index()
	var newValue = differential.sign()[maxAxisIndex]
	var newVector = Vector3.ZERO
	newVector[maxAxisIndex] = newValue
	velocity = newVector * 5
