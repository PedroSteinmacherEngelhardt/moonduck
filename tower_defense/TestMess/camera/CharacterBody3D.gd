extends CharacterBody3D

const spd = 5.0

func _physics_process(delta):

	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var dir = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if dir:
		velocity.x = dir.x * spd
		velocity.z = dir.z * spd
	else:
		velocity.x = move_toward(velocity.x, 0, spd)
		velocity.z = move_toward(velocity.z, 0, spd)

	move_and_slide()
