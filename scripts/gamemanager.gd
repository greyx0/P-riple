extends Node

var current_stage: int = 1
var max_stages: int = 22

var active_special_attack: Resource = null
var stat_bonuses = {
	"speed": 0.0,
	"secondary_ammo_bonus": 0
}

@export var all_minor_arcana: Array[Resource] = []

func progress_to_next_stage() -> void:
	current_stage += 1
	if current_stage > max_stages:
		#get_tree().change_scene_to_file("res://scenes/ui/VictoryScreen.tscn")
		pass
	else:
		#get_tree().change_scene_to_file("res://scenes/levels/BossStage.tscn")
		pass
