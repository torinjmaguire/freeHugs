extends CharacterBody3D

@export var speed: float = 20.0
@export var jump_velocity: float = 15

var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")

func _physics_process(delta: float) -> void:
	
	# Reset if we fall off the map
	if position.y < 0:
		position = Vector3(51, 82.244, -16.213)

	# Vertical movement
	if not is_on_floor():
		velocity.y -= gravity * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity

	# Lateral Movement
	var input_dir: Vector2 = Input.get_vector("move_left", "move_right", "move_forward", "move_backwards")
	var direction: Vector3 = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * speed
		velocity.z = direction.z * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		velocity.z = move_toward(velocity.z, 0, speed)

	# Process movement
	move_and_slide()
