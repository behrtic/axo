extends Area2D

@export var speed = 600
var direction = Vector2.ZERO

func _process(delta):
	position += direction * speed * delta
	
	#Deletes if off screen
	if position.length() > 3000:
		queue_free()
