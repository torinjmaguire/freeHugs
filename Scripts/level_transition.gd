extends Area3D

@export var level_path: String
signal player_entered

func _ready() -> void:
	self.body_entered.connect(detect_player)
	player_entered.connect(LevelManager.switchLevel)

func detect_player(body: Node3D) -> void:
	if body.get_name() == "Player":
		player_entered.emit(level_path)
