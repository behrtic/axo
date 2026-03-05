extends Node2D

#Basic Enemy Spawning
@export var enemy_scene : PackedScene
@export var spawn_radius = 500
@export var spawn_rate = 2.0
@export var arena_size: Vector2 = Vector2(1200, 800)

var timer = 0
var player

func _ready():
	player = get_parent().get_node("Player")
	
	if player == null:
		push_error("Player not found!")

func _process(delta):
	print(player)
	timer += delta
	
	if timer >= spawn_rate:
		timer = 0
		spawn_enemy()
		
func spawn_enemy():
		var enemy = enemy_scene.instantiate()
		
		var side = randi() % 4
		var spawn_pos = Vector2()
	
		enemy.position = spawn_pos
		enemy.player = player
		
		if side == 0:
			spawn_pos = Vector2(-50, randf_range(0, arena_size.y)) # left
		elif side == 1:
			spawn_pos = Vector2(arena_size.x + 50, randf_range(0, arena_size.y))
		elif side == 2:
			spawn_pos = Vector2(randf_range(0, arena_size.x), -50)
		else:
			spawn_pos = Vector2(randf_range(0, arena_size.x), arena_size.y + 50)
			
		enemy.position = spawn_pos
		add_child(enemy)
