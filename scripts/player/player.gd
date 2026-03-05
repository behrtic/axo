extends CharacterBody2D

#Arena Bounding 
@export var arena_size = Vector2(1200, 800)


#Player Movement Script
@export var speed = 200

func _physics_process(delta):

	var direction = Vector2.ZERO

	direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	direction.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")

	direction = direction.normalized()

	velocity = direction * speed

	move_and_slide()
	
	position = position.clamp(Vector2.ZERO, arena_size)
