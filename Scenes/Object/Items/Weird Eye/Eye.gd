extends Node3D
var player_in_area = false
var Ivy = null

@export var item: ItemData

# Called when the node enters the scene tree for the first time.
func _ready():
	var anim = $AnimatedSprite3D
	anim.play("default")


func _process(delta):
	if player_in_area:
		if Input.is_action_just_pressed("Interact"):
			Ivy.collect(item)
			$AnimationPlayer.play("Fade")
			await get_tree().create_timer(1.2).timeout
			queue_free()

		

func _on_pick_up_body_entered(body):
	if body.has_method("Ivy"):
		player_in_area =true
		Ivy = body

func _on_pick_up_body_exited(body):
	if body.has_method("Ivy"):
		player_in_area =false
