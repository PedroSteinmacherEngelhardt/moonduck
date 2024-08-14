extends StaticBody3D


@onready var catapult_tower = preload("res://tower_defense/TestMess/catapult_tower.tscn")


func _on_input_event(camera, event, position, normal, shape_idx):
	return
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
			add_child(catapult_tower.instantiate())
