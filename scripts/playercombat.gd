extends Node

@export var basic_bullet_scene: PackedScene
@export var secondary_bullet_scene: PackedScene
@export var max_secondary_ammo: int = 3
var secondary_ammo: int = 3
var reload_timer: float = 0.0
@export var reload_time: float = 2.0

var special_attack_resource: Resource = null
var player_position = owner.global_position

func _process(delta: float) -> void:
	if secondary_ammo < max_secondary_ammo:
		reload_timer += delta
		if reload_timer >= reload_time:
			secondary_ammo += 1
			reload_timer = 0.0

	# Input spari
	if Input.is_action_just_pressed("shoot_basic"):
		_fire_basic()
	if Input.is_action_just_pressed("shoot_secondary") and secondary_ammo > 0:
		_fire_secondary()
	if Input.is_action_just_pressed("use_special") and special_attack_resource:
		_fire_special()

func _fire_basic() -> void:
	var bullet = basic_bullet_scene.instantiate()
	get_tree().current_scene.add_child(bullet)

func _fire_secondary() -> void:
	secondary_ammo -= 1
	var bullet = secondary_bullet_scene.instantiate()
	get_tree().current_scene.add_child(bullet)

func _fire_special() -> void:
	if special_attack_resource:
		special_attack_resource.execute(owner)
