extends XRController3D

var velocity = 0
const RAY_LENGTH = 1
@onready var lineRender = $RHMeshInstance3D

var saberState = false

func _ready():
	pass

# actions to happen at every frame
func _process(_delta):
	pass

# applies physics with the pass through value delta
# for physics simulation
func _physics_process(_delta):
	
	if saberState:
		# raycast line
		var space_state = get_world_3d().direct_space_state
		var origin = global_position
		var dir = global_basis.z * -1
		var end = origin + (dir * RAY_LENGTH)
		var query = PhysicsRayQueryParameters3D.create(origin, end)
		query.collide_with_areas = true
		var result = space_state.intersect_ray(query)
		# adding the line render to the controller
		lineRender.points[0] = origin
		lineRender.points[1] = end
		
		if result:
			lineRender.points[1] = result.position
			print("Collided with", + result.collider.name)
	else:
		lineRender.points[0] = Vector3(0,0,0)
		lineRender.points[1] = Vector3(0,0,0)
	
# connecting the left controller collision object
# to the script
func _on_rh_area_3d_area_entered(_area):
	pass # Replace with function body.

func _on_button_pressed(name):
	if name == "ax_button":
		if saberState == false:
			saberState = true
		else:
			saberState = false
		pass
