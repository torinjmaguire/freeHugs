extends Node3D

var t = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _physics_process(delta):
	rotate_x(pendCalc(1, 2, t))
	t += 1 * delta
	
func pendCalc(a, T, t):
	## Calculates 
	var A = deg_to_rad(a)
	var w = (2*PI)/T

	return A * cos(w*t)
