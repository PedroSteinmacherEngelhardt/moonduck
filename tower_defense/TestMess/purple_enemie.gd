extends CharacterBody3D


@export var speed = 5.0
@export var target : Vector3 = Vector3(0,7,0)


func _physics_process(delta: float) -> void:
	position = position.move_toward(target, delta * speed)
	
	if position == target:
		queue_free()
