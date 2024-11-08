extends Node3D

@export var lookSpeed : float

# accumulators
var rot_x = 0
var rot_y = 0

var mouseHold : Vector2

func _init():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func _input(event):
	
	# Close 
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()
	
	# Simple cam controller 
	if event is InputEventMouseMotion:
		# modify accumulated mouse rotation
		rot_x += event.relative.x * lookSpeed * get_process_delta_time()
		rot_y += event.relative.y * lookSpeed * get_process_delta_time()
		transform.basis = Basis() # reset rotation
		rotate_object_local(Vector3(0, 1, 0), rot_x) # first rotate in Y
		rotate_object_local(Vector3(1, 0, 0), rot_y) # then rotate in X
