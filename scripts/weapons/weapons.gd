extends Node2D

@export var projectile_scene : PackedScene
@export var fire_rate = 0.5
@export var range = 600

var fire_timer = 0

func _process(delta):
	
	fire_timer += delta
	
	if fire_timer >= fire_rate:
		fire_timer = 0
		shoot()
		
func shoot():
	
	var enemies = get_tree().get_nodes_in_group("enemy")
	
	if enemies.size() == 0:
		return
		
	var closest_enemy = enemies[0]
	var closest_distance = global_position.distance_to(closest_enemy.global_position)
	
	for enemy in enemies: 
		
		var d = global_position.distance_to(enemy.global_position)
		
		if d < closest_distance:
			closest_enemy = enemy
			closest_distance = d
			
		var projectile = projectile_scene.instantiate()
		
		var direction = (closest_enemy.global_position - global_position).normalized()
		
		projectile.direction = direction
		projectile.position = global_position
		
		get_tree().current_scene.add_child(projectile)
		
