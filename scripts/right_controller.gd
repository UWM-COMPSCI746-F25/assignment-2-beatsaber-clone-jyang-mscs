extends XRController3D

const RAY_LENGTH = 1
var saberState = false
@onready var lineRender = $RHMeshInstance3D

@onready var rh_collision_shape_3d = $RHArea3D/RHCollisionShape3D
var collisionState = false

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
			#print("Collided with", + result.collider.name)
			
		rh_collision_shape_3d.disabled = false
		
	else:
		lineRender.points[0] = Vector3(0,0,0)
		lineRender.points[1] = Vector3(0,0,0)
		
		rh_collision_shape_3d.disabled = true
	
# connecting the left controller collision object
# to the script
func _on_rh_area_3d_area_entered(body):
	if body.has_method("take_damage"):
		body.take_damage()
	
	print("blue block hit")

func _on_button_pressed(right_button):
	if right_button == "ax_button":
		#print("A/X is pressed")
		if saberState == false:
			saberState = true
			collisionState = true
		else:
			saberState = false
			collisionState = false
	
	if right_button == "menu_button":
		#print("menu_button is pressed")
		reset_position()
		
func reset_position():
	XRServer.center_on_hmd(1, 1)
