extends Area2D

@export var speed := 500
@export var damage := 1

var direction = Vector2.ZERO

func _process(delta):
	position += direction * speed * delta
	
	#Deletes if off screen
	if position.length() > 3000:
		queue_free()

func _on_body_entered(body):
	
	if body.is_in_group("enemy"):
		body.take_damage(1)
		
		queue_free()
