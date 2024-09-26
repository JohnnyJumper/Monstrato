extends Camera2D

@export var ZOOM_SPEED: float = 10
@export var dragSpeed: float = 200.0

var zoom_target: Vector2
var zoom_factor: float
var zoom_min: Vector2 = Vector2(0.5, 0.5)
var zoom_max: Vector2 = Vector2(5.0, 5.0)

var dragStartMousePos: Vector2 = Vector2.ZERO
var dragStartCameraPos: Vector2 = Vector2.ZERO
var isDragging: bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	zoom_target = zoom
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	zoom_factor = (1 / zoom.x)
	handleZoom(delta)
	handleMovement(delta)



func handleMovement(delta) -> void:
	if !isDragging and Input.is_action_just_pressed("cameraPan"):
		dragStartMousePos = get_viewport().get_mouse_position()
		dragStartCameraPos = position
		isDragging = true
	
	if isDragging and Input.is_action_just_released("cameraPan"):
		isDragging = false
	
	if isDragging:
		var moveVector = get_viewport().get_mouse_position() - dragStartMousePos
		position = dragStartCameraPos - moveVector * dragSpeed * zoom_factor * delta 

func handleZoom(delta: float) -> void: 
	if Input.is_action_just_pressed("ZoomIn"):
		zoom_target *= 1.1
	if Input.is_action_just_pressed("ZoomOut"):
		zoom_target *= 0.9
	zoom_target = clamp(zoom_target, zoom_min, zoom_max)
	zoom = zoom.lerp(zoom_target, ZOOM_SPEED * delta)
