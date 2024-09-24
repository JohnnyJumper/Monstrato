extends Panel

@onready var building_options: Panel = $BuildingOptions

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_button_toggled(toggled_on: bool) -> void:
	building_options.visible = toggled_on
