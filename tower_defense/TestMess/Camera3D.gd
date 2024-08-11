extends Camera3D



func _process(delta):
	if Input.is_action_just_released("camera_turn_right"):
		print("yay")
