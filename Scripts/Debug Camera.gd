extends Camera3D

const SPEED = 100
var dragging = false
var rot_x = 0
var rot_y = 0

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_RIGHT:
		if not dragging and event.is_pressed():
			dragging = true
		elif dragging and not event.is_pressed():
			dragging = false
			
	if event is InputEventMouseMotion and dragging:
		rot_x = event.relative.x
		rot_y = event.relative.y
		tran

func _ready():
	if OS.is_debug_build():
		make_current()
		get_node("/root/Warehouse 1/Player").queue_free()
	
func _physics_process(_delta):
	var inputDir = Input.get_vector("move_left", "move_right","move_forward","move_backwards")
	var vertInput = Input.get_axis("move_down","move_up")
	var direction = (transform.basis * Vector3(inputDir.x, vertInput, inputDir.y)).normalized()
	if direction:
		translate(direction)
