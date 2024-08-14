extends CharacterBody3D

@export var push_distance := 2
@export var player: CharacterBody3D
@export var pushable_area: Area3D
var push_range := 3

func _init() -> void:
	# Use global position as our default position for simpler movement calculations
	self.top_level = true

func is_dest_clear(origin: Vector3, dest: Vector3) -> bool:
	var results := get_world_3d().direct_space_state.intersect_ray(PhysicsRayQueryParameters3D.create(origin, dest))
	
	if not results:
		return true
	else:
		return false

func is_move_in_bounds(point: Vector3, area: Area3D) -> bool:
	var params := PhysicsPointQueryParameters3D.new()
	params.position = point
	params.collide_with_areas = true
	params.collide_with_bodies = false
	var results := get_world_3d().direct_space_state.intersect_point(params)
	
	# Check every area our point is in to see if our bounding area is one of them
	if results.any(func(dict: Dictionary) -> bool: return dict.rid == area.get_rid()):
		return true
	else:
		return false

func is_in_push_range() -> bool:
	var distance := self.position.distance_to(player.global_position)
	if distance < push_range:
		return true
	else:
		return false

func push_box() -> void:
	var box_position := position
	var player_position := player.global_position
	var direction := box_position.direction_to(player_position)
	
	# Isolate the axis that the player is trying to push along
	direction.y = 0
	if direction.abs().x < direction.abs().z:
		direction.x = 0
	else:
		direction.z = 0
	
	# Adding 1 to account for the width of the cubes
	direction = direction.normalized() * (push_distance + 1) * -1
	var destination: Vector3 = direction + box_position
	
	if is_move_in_bounds(destination, pushable_area) and is_in_push_range() and is_dest_clear(box_position, destination):
		var tween: Tween = create_tween()
		tween.tween_property(self, "position", destination, 0.3)

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("interact"):
		push_box()

