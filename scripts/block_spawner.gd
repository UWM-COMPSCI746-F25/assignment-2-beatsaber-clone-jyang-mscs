extends Node3D

@export var block_to_spawn: PackedScene = null

@onready var dir = Vector3(0, 0, 1)
@onready var speed = 1

@onready var marker_3d = %Marker3D
@onready var timer = %Timer

func _process(delta):
	global_position += dir * (speed * delta)
	
	
func _on_timer_timeout():
	var new_block = block_to_spawn.instantiate()
	new_block.material - load("res://colors/left_boxes_red.tres")
	add_child(new_block)
	new_block.global_position = marker_3d.global_position
