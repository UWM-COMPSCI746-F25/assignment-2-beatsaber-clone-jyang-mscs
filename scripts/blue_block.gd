extends RigidBody3D

# variable to track health
var health = 1

# variable to track direciton block will travel
@onready var dir = Vector3(0, 0, 1)

#variable to determince speed of block
@onready var speed = 1

# variables for timer and audio nodes
@onready var timer = %Timer
@onready var hurt_sound = %HurtSound

# variable for signal called
signal died


func _process(delta):
	# when block is instantiated, move block by x-speed
	global_position += dir * (speed * delta)
	
	# if block is ever past x-distance, despawns the block
	if global_position.z > 10:
		queue_free()
	
func take_damage():
	# if block has no health, do nothing
	if health == 0:
		return
	
	# otherwise, when take_damage is called, minus 1 health
	health -= 1
	
	# when health is 0, turn on gravity
	if health == 0:
		set_physics_process(false)
		gravity_scale = 1.0
		
		# plays sound for death of block
		hurt_sound.play()
		
		# starts timer for despawning
		timer.start()
		
		# emits signal
		died.emit()
		
		
# this is called when timer is 0 to remove block
func _on_timer_timeout():
	queue_free()
