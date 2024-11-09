extends MeshInstance3D
@export var v : float  
@export var s : float
var startY : float
var timer : float
# Called when the node enters the scene tree for the first time.
func _ready():
	startY = position.y


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer += delta * v; 
	position.y = startY + sin(timer)
