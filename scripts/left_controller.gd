extends XRController3D

var velocity = 0
const RAY_LENGTH = 5
@onready var lineRender = $"LHMeshInstance3D"

func _ready():
	pass

# actions to happen at every frame
func _process(delta):
	pass

# applies physics with the pass through value delta
# for physics simulation
func _physics_process(delta):
	
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
	
	

	
# connecting the left controller collision object
# to the script
func _on_lh_area_3d_area_entered(area):
	pass # Replace with function body.
