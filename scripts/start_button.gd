extends StaticBody3D

# this variable will be use to animate the button
@onready var button = $Button

# this variable is for manupilating the UI text
@onready var ui = $UI

# enum object - list different states of button
enum STATE {
	ON,
	OFF
}

@onready var state = STATE.OFF

signal on_state_changed

# shows text to user
func get_start_text():
	if state == STATE.ON:
		return "to turn off"
	return "to turn on"
	
#checks the state of the button
func interact():
	if state == STATE.ON:
		turn_off()
	else:
		turn_on()
		
func turn_off():
	if state == STATE.OFF:
		return
	
	state = STATE.OFF
	button.transform.height = 0.007
	button.transform.height = 0.02

func turn_on():
	if state == STATE.ON:
		return
	
	state = STATE.ON
	button.transform.height = 0.007
	button.transform.height = 0.02
	


func _on_button_area_area_entered(area):
	pass # Replace with function body.
