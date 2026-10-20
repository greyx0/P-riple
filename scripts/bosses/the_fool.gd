class_name BossTheFool
extends BossBase 

@onready var pattern_spawner: PatternSpawner = $PatternSpawner
@export var fool_bullet_scene: PackedScene

@export var teleport_cooldown: float = 3.0
var teleport_timer: float = 0.0

func start_boss_fight() -> void:
	super.start_boss_fight()
	
	_execute_fool_loop()

func _physics_process(delta: float) -> void:
	teleport_timer += delta
	if teleport_timer >= teleport_cooldown:
		_teleport_gimmick()
		teleport_timer = 0.0

func _teleport_gimmick() -> void:
	var screen_size = get_viewport_rect().size
	var random_x = randf_range(100, screen_size.x - 100)
	var random_y = randf_range(100, screen_size.y - 100)
	
	global_position = Vector2(random_x, random_y)
	
	if pattern_spawner and fool_bullet_scene:
		pattern_spawner.execute_pattern(fool_bullet_scene)

func _execute_fool_loop() -> void:
	# Altri comportamenti o routine di attacco alternati...
	pass
