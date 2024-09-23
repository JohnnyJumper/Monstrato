extends CharacterBody2D

@onready var sprite: AnimatedSprite2D = $Sprite2D

const SPEED = 150.0
const JUMP_VELOCITY = -400.0

var start_movement = false

func _physics_process(delta: float) -> void:
	if (start_movement):
		velocity.y = -SPEED
		sprite.animation = 'Running'
	move_and_slide()


func _on_timer_timeout() -> void:
	start_movement = true
