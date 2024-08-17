extends Node

enum State {
	building,
	flying
}

var current_state = State.building

var camera_build : Camera3D
var camera_flying : Camera3D
var player : CharacterBody3D

func _input(event):
	if Input.is_action_just_pressed("space"):
		if current_state == State.building:
			Input.mouse_mode = Input.MOUSE_MODE_CONFINED_HIDDEN
			player.position = camera_build.global_position
			player.rotation = camera_build.get_parent().rotation
			player.camera.current = true
			current_state = State.flying
		
		elif current_state == State.flying:
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
			camera_build.current = true
			current_state = State.building
			
