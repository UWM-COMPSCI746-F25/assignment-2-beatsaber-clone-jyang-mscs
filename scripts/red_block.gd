extends RigidBody3D

# variable to track health
var health = 1

# variable to track direciton block will travel
@onready var dir = Vector3(0, 0, 1)
@onready var speed = 1

# variable for timer and adio nodes
@onready var timer = %Timer
@onready var hurt_sound = %HurtSound

# variable for signal called
signal died

# code in this function gets called every frame - delta applies physics
func _process(delta):
	global_position += dir * (speed * delta)
	
	if global_position.z > 10:
		queue_free()
	
func take_damage():
	if health == 0:
		return
	
	health -= 1
	
	if health == 0:
		set_physics_process(false)
		gravity_scale = 1.0
		
		timer.start()
		died.emit()
		hurt_sound.play()


func _on_timer_timeout():
	queue_free()
