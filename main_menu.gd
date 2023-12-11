extends AspectRatioContainer

var Warehouse1Button: Button
var Warehouse2Button: Button

# Called when the node enters the scene tree for the first time.
func _ready():
	Warehouse1Button = $MarginContainer/VBoxContainer/Warehouse1Button
	Warehouse2Button = $MarginContainer/VBoxContainer/Warehouse2Button

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_warehouse_1_button_pressed():
	get_tree().change_scene_to_packed(Singleton.warehouse1)

func _on_warehouse_2_button_pressed():
	get_tree().change_scene_to_packed(Singleton.warehouse2)
