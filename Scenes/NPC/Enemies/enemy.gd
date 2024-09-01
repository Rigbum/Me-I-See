extends CharacterBody3D

var speed = 125
var Ivy_chase = false
var Ivy = null
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var player_in_area = false

func _process(delta):
	if player_in_area:
		if Input.is_action_just_pressed("Interact"):
			$AnimatedSprite3D.play("boom")
			await get_tree().create_timer(1).timeout
			queue_free()

func _physics_process(delta):
	if Ivy_chase:
		position += (Ivy.position - position)/speed

		$AnimatedSprite3D.play("walk")
		
		if(Ivy.position.x - position.x) < 0:
			$AnimatedSprite3D.flip_h = true
		else:
			$AnimatedSprite3D.flip_h = false
	else:
		$AnimatedSprite3D.play("Idle")	
	move_and_slide()
	movement(delta)



func _on_aggro_range_body_entered(body):
	Ivy = body
	Ivy_chase = true
	if body.has_method("Ivy"):
		player_in_area =true

func _on_aggro_range_body_exited(body):
	Ivy = null
	Ivy_chase = false
	if body.has_method("Ivy"):
		player_in_area =false

func movement(delta):
	if not is_on_floor():
		velocity.y -= gravity * delta

	
