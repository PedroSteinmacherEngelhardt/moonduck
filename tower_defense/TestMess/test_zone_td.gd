extends Node3D

@onready var catapult_tower = preload("res://tower_defense/TestMess/catapult_tower.tscn")
@onready var camera = $pivot/Camera3D


func _ready():
	GameState.current_state = GameState.State.building
	GameState.camera_build = camera


func _physics_process(delta):
	if GameState.current_state != GameState.State.building:
		return
	
	var mouse_position = get_viewport().get_mouse_position()
	var camera:Camera3D = get_viewport().get_camera_3d()
	
	var ray_from = camera.project_ray_origin(mouse_position)
	var ray_to = ray_from + camera.project_ray_normal(mouse_position) * 1000.0
	var ray_param:PhysicsRayQueryParameters3D = PhysicsRayQueryParameters3D.create(ray_from,ray_to)
	ray_param.collision_mask = 2
	
	var raycasted_result = camera.get_world_3d().get_direct_space_state().intersect_ray(ray_param)
	if raycasted_result:
		var pos = raycasted_result.position
		$TowerSpot.position = pos
		if Input.is_action_just_pressed("mouse_left"):
			var instance = catapult_tower.instantiate()
			instance.scale *= 3
			instance.position = pos
			add_child(instance)
