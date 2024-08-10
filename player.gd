extends Node3D

@onready var player : CharacterBody3D = $CharacterBody3D
@onready var camera : Camera3D = $Camera3D

@export var speed = 400


func _process(delta):
	var input_vector = Input.get_vector("left", "right", "up", "down").normalized()
	
	var z = lerp(player.rotation.z, -input_vector.x, 5 * delta)
	player.rotation.z = z
	
	#var velocity = input_vector * speed
	
	#player.velocity += Vector3(velocity.x,velocity.y,0)
	#camera.position = camera.position.lerp(Vector3((input_vector.x + camera.position.x)/2,(-input_vector.y + -camera.position.y)/2,camera.position.z),1.1 * delta)


func _on_camera_3d_child_exiting_tree(node):
	print(node)
