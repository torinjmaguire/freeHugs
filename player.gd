extends CharacterBody3D

# How fast the player moves in meters per second.
@export var speed = 14
# The downward acceleration when in the air, in meters per second squared.
@export var fall_acceleration = 75
#...
# Vertical impulse applied to the character upon jumping in meters per second.
@export var jump_impulse = 20
var puzzleBoxCollider = null

var target_velocity = Vector3.ZERO

func _input(event):
	if event.is_action_pressed("interact"):
		if $RayCast3D.get_collider() and !$RayCast3D.get_collider() is CSGCombiner3D:
			$RayCast3D.get_collider().pushed(position)
			
		
func _physics_process(delta):
	var direction = Vector3.ZERO

	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_back"):
		direction.z += 1
	if Input.is_action_pressed("move_forward"):
		direction.z -= 1

	if direction != Vector3.ZERO:
		direction = direction.normalized()
		$MeshInstance3D.look_at(position + direction, Vector3.UP)
		$RayCast3D.look_at(position + direction, Vector3.UP)

	# Ground Velocity
	target_velocity.x = direction.x * speed
	target_velocity.z = direction.z * speed

	# Vertical Velocity
	if not is_on_floor(): # If in the air, fall towards the floor. Literally gravity
		target_velocity.y = target_velocity.y - (fall_acceleration * delta)

	# Moving the Character
	velocity = target_velocity
	
		# Jumping.
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		target_velocity.y = jump_impulse
	
	move_and_slide()
	
	for c in get_slide_collision_count():
		var collided = get_slide_collision(c).get_collider()
		if collided.get_parent().get_name() == "smallPillar":
			get_tree().change_scene_to_packed(Singleton.warehouse2)
