@tool
class_name PatternSpawner
extends Node2D

@export var pattern_data: BossPattern:
	set(value):
		pattern_data = value
		if pattern_data and not pattern_data.changed.is_connected(queue_redraw):
			pattern_data.changed.connect(queue_redraw)
		queue_redraw()

@export var preview_in_editor: bool = true:
	set(value):
		preview_in_editor = value
		queue_redraw()

func _draw() -> void:
	if not Engine.is_editor_hint() or not preview_in_editor or not pattern_data:
		return
	
	var center = Vector2.ZERO
	for i in range(pattern_data.bullet_count):
		var angle = (i * TAU) / pattern_data.bullet_count
		var pos = center + Vector2(cos(angle), sin(angle)) * pattern_data.radius
		draw_circle(pos, 6.0, Color.RED)

func execute_pattern(bullet_scene: PackedScene) -> void:
	if not pattern_data: return
	
	for i in range(pattern_data.bullet_count):
		var angle = (i * TAU) / pattern_data.bullet_count
		var bullet = bullet_scene.instantiate() as Node2D
		
		bullet.global_position = global_position
		
		var direction = Vector2(cos(angle), sin(angle))
		
		if bullet.has_method("setup"):
			bullet.setup(direction * pattern_data.bullet_speed)
		
		get_tree().current_scene.add_child(bullet)
