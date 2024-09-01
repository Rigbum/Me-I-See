extends CharacterBody3D

class_name Player

const SPEED = 2.5
const JUMP_VELOCITY = 2.5

@export var inv: InventoryData


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var current_dir = "none"

	
func _physics_process(delta):
	player_movement(delta)

func player_movement(delta):
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY



	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("Left", "Right", "Forward", "Backward")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
		
	if Input.is_action_pressed("Left"):
		current_dir = "left"
		play_anim(1)
		velocity.x = -SPEED
		velocity.y = 0
	elif Input.is_action_pressed("Right"):
		current_dir = "right"
		play_anim(1)
		
	elif Input.is_action_pressed("Forward"):
		current_dir = "up"
		play_anim(1)
		
	elif Input.is_action_pressed("Backward"):
		current_dir = "back"
		play_anim(1)
	
	else:
		play_anim(0)
		
	
	move_and_slide()

func play_anim(movement):
	var dir = current_dir
	var anim = $AnimatedSprite3D
	
	if dir == "right":
		anim.flip_h = false
		if movement == 1:
			anim.play("Walk_R")
		elif movement == 0:
			anim.play("Idle_Side_2")
	if dir == "left":
		anim.flip_h = false
		if movement == 1:
			anim.play("Walk_L")
		elif movement == 0:
			anim.play("Idle_Side")
	if dir == "up":
		anim.flip_h = false
		if movement == 1:
			anim.play("Walk_B")
		elif movement == 0:
			anim.play("Idle_Back")
	if dir == "back":
		anim.flip_h = false
		if movement == 1:
			anim.play("Walk_F")
		elif movement == 0:
			anim.play("Idle_Front")

func Ivy():
	pass

func collect(item):
	inv.insert(item)
