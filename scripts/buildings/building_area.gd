extends Panel

@onready var building_options: Panel = $BuildingOptions

@export var open_speed = 10
@export var close_speed = 4
var buttonClicked: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if buttonClicked:
		openOptions(delta)
	else: 
		closeOptions(delta)

func openOptions(delta: float) -> void: 
	building_options.visible = true
	var target_size = Vector2(170, building_options.size.y)
	building_options.size = building_options.size.lerp(target_size, open_speed * delta)

func closeOptions(delta: float) -> void:
	var target_size = Vector2(0, building_options.size.y)
	building_options.size = building_options.size.lerp(target_size, open_speed * delta * close_speed)
	if building_options.size.x < 1:
		building_options.visible = false

func _on_button_toggled(toggled_on: bool) -> void:
	buttonClicked = toggled_on
