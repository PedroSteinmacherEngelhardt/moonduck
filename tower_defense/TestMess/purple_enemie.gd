extends CharacterBody3D


@export var speed = 5.0
@export var target : Vector3

@onready var animation_player : = $AnimationPlayer


func _physics_process(delta: float) -> void:
	position = position.move_toward(target, delta * speed)


func fly_away() -> void:
	animation_player.play("byebye")


func morri() -> void:
	animation_player.play("morri")
