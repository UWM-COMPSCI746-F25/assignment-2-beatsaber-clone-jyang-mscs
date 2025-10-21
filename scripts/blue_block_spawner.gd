extends Node3D

@export var block_to_spawn: PackedScene = null

@onready var block_marker = %BlockMarker
@onready var timer = %Timer

var rng = RandomNumberGenerator.new()

#const LEFT_BOXES_RED = preload("res://colors/left_boxes_red.tres")
#const RIGHT_BOXES_BLUE = preload("res://colors/right_boxes_blue.tres")


func _process(delta):
	
	timer.wait_time = rng.randf_range(1.0, 2.5)
	
	
	
	
func _on_timer_timeout():
	# spawns the node
	var new_block = block_to_spawn.instantiate()
	
	# add the node as the child of the spawner
	add_child(new_block)
	
	# adjust the position of the spawned block
	new_block.global_position = block_marker.global_position
	new_block.global_position.y = randf_range(0.5, 2.0)
	
func _ready():
	pass
	
	
