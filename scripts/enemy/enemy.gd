extends CharacterBody2D

#Basic Enemy Movement Script
@export var speed: float = 100.0
@export var max_health: int = 3

var health
var player: Node2D

func _ready():
	health = max_health


func _physics_process(delta):
	
	if player == null:
		return
		
	var direction = player.global_position - global_position
	direction = direction.normalized()
	velocity = direction * speed
	move_and_slide()
	
func take_damage(damage):
	health -= damage
	
	if health <= 0:
		die()
		
func die():
	queue_free()
