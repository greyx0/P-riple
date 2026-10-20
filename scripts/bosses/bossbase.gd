class_name BossBase
extends CharacterBody2D

@export var boss_name: String
@export var card_texture: Texture2D
@export var animated_sprite: AnimatedSprite2D

func _ready() -> void:
	_play_intro_cutscene()

func _play_intro_cutscene() -> void:
	animated_sprite.visible = false
	await get_tree().create_timer(2.0).timeout
	animated_sprite.visible = true
	start_boss_fight()

func start_boss_fight() -> void:
	pass
