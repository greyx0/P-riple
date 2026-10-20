extends CharacterBody2D

@export var speed: float = 300.0

func _physics_process(delta: float) -> void:
	var direction := Vector2(
		Input.get_axis("move_left", "move_right"),
		Input.get_axis("move_up", "move_down")
	).normalized()
	
	velocity = direction * speed
	move_and_slide()
	
	_apply_screen_wrap()

func _apply_screen_wrap() -> void:
	var screen_size = get_viewport_rect().size
	if global_position.x < 0:
		global_position.x = screen_size.x
	elif global_position.x > screen_size.x:
		global_position.x = 0
		
	if global_position.y < 0:
		global_position.y = screen_size.y
	elif global_position.y > screen_size.y:
		global_position.y = 0
