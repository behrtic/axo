extends Node2D

#Basic Enemy Spawning
@export var enemy_scene : PackedScene
@export var spawn_radius = 500
@export var spawn_rate = 2.0

var timer = 0
var player

func _ready():
	player = get_parent().get_node("Player")
	
	if player == null:
		push_error("Player not found!")

func _process(delta):
	
	timer += delta
	
	if timer >= spawn_rate:
		timer = 0
		spawn_enemy()
		
func spawn_enemy():
		
	var enemy = enemy_scene.instantiate()
		
	var angle = randf() * TAU
	var pos = Vector2(cos(angle), sin(angle)) * spawn_radius
		
	enemy.position = player.position + pos
	enemy.player = player
		
	add_child(enemy)
