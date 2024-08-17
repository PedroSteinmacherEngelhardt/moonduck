extends Node3D

@onready var catapult_tower = preload("res://tower_defense/TestMess/catapult_tower.tscn")
@onready var enimy = preload("res://tower_defense/TestMess/purple_enemie.tscn")

@onready var camera = $pivot/Camera3D
@onready var catapultPlacer = $CatapultTowerPlacer

var catapults = false

func _ready():
	GameState.current_state = GameState.State.building
	GameState.camera_build = camera
	
	catapultPlacer.hide()
	
	spawn_creeps()


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
		catapultPlacer.position = pos
		var can_place = true
		
		if catapultPlacer.has_overlapping_bodies():
			can_place = false
		
		if Input.is_action_just_pressed("mouse_left") and catapults and can_place:
			var instance = catapult_tower.instantiate()
			instance.scale *= 3
			instance.position = pos
			add_child(instance)


func spawn_creeps():
	var creep = enimy.instantiate()
	
	var pos = randf_range(-17.5,17.5)
	var r = randi_range(0,1)
	var s = randi_range(0, 1) * 2 - 1
	
	if r == 0:
		creep.position = Vector3(pos,7,17.5 * s)
	else:
		creep.position = Vector3(17.5 * s,7,pos)
	
	add_child(creep)
	await get_tree().create_timer(1).timeout
	spawn_creeps()


func _on_button_button_down() -> void:
	catapultPlacer.visible = true
	await get_tree().create_timer(.1).timeout
	catapults = true
