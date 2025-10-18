extends RigidBody3D

signal died

var health = 1
@onready var dir = Vector3(0, 0, 1)
@onready var speed = 1

#@onready var player = get_node("root/Main/XROrigin3D")

@onready var timer = %Timer

@onready var hurt_sound = %HurtSound


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
		#var direction = global_position.direction_to(player.global_position)
		#var randomUpwardForce = Vector3.UP * randf_range(1.0,5.0)
		#apply_central_impulse(direction * 10 + randomUpwardForce)
		
		timer.start()
		died.emit()
		hurt_sound.play()


func _on_timer_timeout():
	queue_free()
