extends KinematicBody2D

var move_speed = 200
var direction = Vector2.ZERO
var velocity = Vector2.ZERO

func _physics_process(delta):
	direction = Vector2.ZERO

	if Input.is_action_pressed("move_up"):
		direction.y = -1
	elif Input.is_action_pressed("move_down"):
		direction.y = 1

	if Input.is_action_pressed("move_left"):
		direction.x = -1
	elif Input.is_action_pressed("move_right"):
		direction.x = 1

	velocity = direction.normalized() * move_speed
	move_and_slide(velocity)

	_update_animation()


func _update_animation():
	var anim_sprite = $"Player Sprite"
	if anim_sprite == null:
		print("⚠️ No AnimatedSprite found!")
		return

	if Input.is_action_pressed("move_down"):
		anim_sprite.play("Run Forward")
	elif Input.is_action_pressed("move_up"):
		anim_sprite.play("Run Backward")
	else:
		anim_sprite.play("Idle")

