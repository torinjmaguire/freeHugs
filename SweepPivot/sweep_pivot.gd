extends Marker3D

@export var length: float
@export var amplitude: float
@export var phase: float
@export var angular_frequency: float = 2*PI
var time = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$CharacterBody3D.translate(Vector3.DOWN * length)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	rotation.x = compute_pendulum(time)
	time += delta

func compute_pendulum(time):
	return amplitude * cos(angular_frequency * time - phase)
