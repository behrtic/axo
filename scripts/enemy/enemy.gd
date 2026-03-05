extends CharacterBody2D

#Basic Enemy Movement Script
@export var speed: float = 120.0
var player: Node2D


func _physics_process(delta):
	
	if player == null:
		return
		
	var direction = player.global_position - global_position
	direction = direction.normalized()
	
	velocity = direction * speed
	
	move_and_slide()
