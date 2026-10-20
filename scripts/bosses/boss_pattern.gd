class_name BossPattern
extends Resource

@export var pattern_name: String = "Cerchio Base"
@export_range(1, 60, 1) var bullet_count: int = 12
@export_range(20.0, 400.0, 10.0) var radius: float = 100.0
@export var bullet_speed: float = 200.0
