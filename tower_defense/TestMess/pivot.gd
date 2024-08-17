extends Node3D

@export var mouse_sensitivity = 0.3

func _input(event):
	if event is InputEventMouseMotion:
		if Input.is_action_pressed("mouse_right"):
			rotation.x += deg_to_rad(-event.relative.y*mouse_sensitivity)
			rotation.y += deg_to_rad(-event.relative.x*mouse_sensitivity)
		
