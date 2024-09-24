extends Camera2D

var ZOOM_MIN = Vector2(0.5, 0.5)
var ZOOM_MAX = Vector2(5.0, 5.0)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ZoomIn"):
		zoom *= 1.1
	if Input.is_action_just_pressed("ZoomOut"):
		zoom /= 1.1
	
	zoom = clamp(zoom, ZOOM_MIN, ZOOM_MAX)



	
