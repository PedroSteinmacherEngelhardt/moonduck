extends Camera3D

@export var pivot : Node3D

var mouseSensitivity : int = 1000


func _ready():
	pass
	#Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	

func _input(event):
	return
	if Input.is_action_just_pressed("escape"):
		if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		else:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
	if event is InputEventMouseMotion:
		pivot.rotation.x -= event.relative.y / mouseSensitivity
		#pivot.rotation.x = clamp(pivot.rotation.x, deg_to_rad(-70), deg_to_rad(50))
		pivot.rotation.y += -event.relative.x / mouseSensitivity

