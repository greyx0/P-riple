class_name MinorArcanaCard
extends Resource

@export var card_name: String
@export_multiline var description: String
@export var card_icon: Texture2D

enum EffectType { STAT_BOOST, EXTRA_AMMO, SPECIAL_ATTACK, CHANCE }
@export var effect_type: EffectType

@export var stat_boost_amount: float = 0.0
@export var special_attack_resource: Resource = null
