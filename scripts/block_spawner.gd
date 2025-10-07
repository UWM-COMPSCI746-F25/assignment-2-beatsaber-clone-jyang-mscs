extends Node3D

@onready var dir = Vector3(0, 0, 1)
@onready var speed = 1

func _process(delta):
	global_position += dir * (speed * delta)
	
