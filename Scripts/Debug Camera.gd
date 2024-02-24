extends Camera3D

const SPEED = 100

func _ready():
	if OS.is_debug_build():
		make_current()
	
func _physics_process(delta):
	var inputDir = Input.get_vector("move_left", "move_right","move_forward","move_backwards")
	var vertInput = Input.get_axis("move_down","move_up")
	var direction = (transform.basis * Vector3(inputDir.x, vertInput, inputDir.y)).normalized()
	if direction:
		translate(direction)
