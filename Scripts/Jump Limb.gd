extends Node3D

const JUMP_VELOCITY = 16
var parent: CharacterBody3D

func _ready():
	parent = self.get_parent()

# Handle jump.
func _physics_process(_delta):
	if Input.is_action_just_pressed("ui_accept") and parent.is_on_floor():
		parent.velocity.y = JUMP_VELOCITY
