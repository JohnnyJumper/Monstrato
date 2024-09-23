extends Panel

@onready var building_options: Panel = $BuildingOptions

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#var mousePos = get_global_mouse_position()
	#var spaceState = get_world_2d().direct_space_state
	#
	#spaceState.intersect_point()
	#if (Input.is_action_just_pressed("LeftMouseClick")):
		#print("Hello")
	pass



func _on_button_toggled(toggled_on: bool) -> void:
	print("hello")
	print("toggled_on = ", toggled_on)
	building_options.visible = toggled_on
