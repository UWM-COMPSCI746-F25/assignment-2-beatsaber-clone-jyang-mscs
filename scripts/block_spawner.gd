extends Node3D

@export var block_to_spawn: PackedScene = null



@onready var marker_3d = %Marker3D
@onready var timer = %Timer

var rng = RandomNumberGenerator.new()

func _process(delta):
	
	timer.wait_time = rng.randf_range(0.5, 1.5)
	
	
	
func _on_timer_timeout():
	var new_block = block_to_spawn.instantiate()
	new_block.material - load("res://colors/left_boxes_red.tres")
	add_child(new_block)
	new_block.global_position = marker_3d.global_position
	
	block_to_spawn.emit(new_block)
