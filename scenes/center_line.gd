extends Node

var bigGuy = preload("res://scenes/minions/BigGuy.tscn")
@onready var path_2d: Path2D = $SpawnPoint/Path2D


func _on_spawn_pressed() -> void:
	var minion = bigGuy.instantiate()
	var start_point = path_2d.curve.get_point_position(0)
	minion.position = start_point
	get_parent().get_node('CenterLine').add_child(minion)
	
	
