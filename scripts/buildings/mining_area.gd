extends Node2D

@onready var building_button: Panel = $buildingButton
@onready var sprite: AnimatedSprite2D = $Sprite
@onready var animation_timer: Timer = $Sprite/AnimationTimer
@onready var build_time_bar: ProgressBar = $buildTimeBar
@onready var building_timer: Timer = $buildTimeBar/BuildingTimer

var isBuilding = false
var isComplete = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	building_button.visible = true
	build_time_bar.visible = false
	sprite.stop()
	sprite.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (isBuilding):
		build_time_bar.value = (1 - (building_timer.time_left / building_timer.wait_time)) * 100

func start_building() -> void:
	isBuilding = true
	build_time_bar.visible = true
	building_timer.start()

func _on_button_pressed() -> void:
	start_building()

func _on_timer_timeout() -> void:
	Global.gold += 1

func _on_building_timer_timeout() -> void:
	isBuilding = false
	isComplete = true
	building_button.visible = false
	build_time_bar.visible = false
	sprite.visible = true
	animation_timer.start()
	sprite.play()
	
