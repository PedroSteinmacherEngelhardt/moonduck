extends Node3D

@onready var player : CharacterBody3D = $CharacterBody3D
@onready var camera : Camera3D = $Camera3D

@export var speed = 400
@export var cam_speed = 2


func _process(delta):
	var input_vector = Input.get_vector("left", "right", "up", "down").normalized()
	
	var z = lerp(player.rotation.z, -input_vector.x, 5 * delta)
	var y = lerp(player.rotation.x, input_vector.x * 10, 5 * delta)
	player.rotation.z = z
	player.rotation.y = y
	
	var velocity = input_vector * speed * delta
	
	player.velocity = Vector3(velocity.x,-velocity.y,0)
	player.move_and_slide()
	
	if input_vector:
		print(camera.position.x)
		camera.position += Vector3(input_vector.x,-input_vector.y,0) * cam_speed * delta
		camera.position.x = clamp(camera.position.x, -2.5, 2.5)
		camera.position.y = clamp(camera.position.y, -2.5, 2.5)
	
	position.z += -3 * delta
	
	




