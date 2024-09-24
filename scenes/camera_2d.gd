extends Camera2D

var ZOOM_MIN: Vector2
var ZOOM_MAX: Vector2
var ZOOM_TARGET: Vector2
var ZOOM_SPEED: float
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	ZOOM_MIN = Vector2(0.5, 0.5)
	ZOOM_MAX = Vector2(5.0, 5.0)
	ZOOM_SPEED = 10
	ZOOM_TARGET = zoom
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	handleZoom(delta)



func handleMovement() -> void:
	var mousePos = get_global_mouse_position()
	#if Input.is_action_just_pressed("MouseMiddleClick"):
				


func handleZoom(delta: float) -> void: 
	if Input.is_action_just_pressed("ZoomIn"):
		ZOOM_TARGET *= 1.1
	if Input.is_action_just_pressed("ZoomOut"):
		ZOOM_TARGET *= 0.9
	ZOOM_TARGET = clamp(ZOOM_TARGET, ZOOM_MIN, ZOOM_MAX)
	zoom = zoom.lerp(ZOOM_TARGET, ZOOM_SPEED * delta)
