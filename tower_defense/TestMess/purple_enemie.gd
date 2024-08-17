extends CharacterBody3D


@export var speed = 5.0
@export var target : Vector3


func _physics_process(delta: float) -> void:
	position = position.move_toward(target, delta * speed)
