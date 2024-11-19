extends Camera3D

# Maximum tilt angle for the camera when looking up or down
@export var max_tilt : float = 0.004

# Maximum horizontal shift for the camera (left/right movement)
@export var max_tilt_pos : float = 0.012

# Stores the initial position and rotation of the camera for reference
@onready var current_position : Vector3 = $".".position
@onready var current_tilt : Vector3 = $".".rotation

# Time accumulator for tracking time elapsed, used in the breathing effect
var time_elapsed: float = 0.0

# Settings for the breathing effect
@export_category("Breathing Settings")
@export var breath_timer : float = 5.0  # Duration for one complete breathing cycle (in seconds)
@export var max_breath : float = 0.008 # Maximum intensity of the breathing effect

# Variables for managing the breathing effect smoothness
var breath_value: float = 0.0  # Current breath value for smooth interpolation
var target_breath_value: float = 0.0  # Target value for breath, updated each frame

func _process(delta):
	time_elapsed += delta  # Update the elapsed time
	
	# Apply camera tilting based on mouse position
	camera_tilting(delta)
	
	# Calculate target breath value using a sine wave for smooth up and down motion
	target_breath_value = max_breath * 0.5 * (1.0 + sin(time_elapsed * PI * 2 / breath_timer))
	# Smoothly interpolate breath value towards the target
	breath_value = lerp(breath_value, target_breath_value, 0.1)
	
	# Apply the breathing effect to the camera's vertical position
	position.y = current_position.y + breath_value
	# Adjust the camera's FOV slightly based on the breath effect to create a subtle zoom in/out effect
	fov = lerp(65.0, 65.325, breath_value * 100)

# Function to apply subtle camera tilting based on mouse position
func camera_tilting(delta : float) :
	# Get the mouse position and viewport size
	var mouse_pos = get_viewport().get_mouse_position()
	var viewport_size = get_viewport().get_size()
	
	# Normalize mouse coordinates to range between -1 and 1
	var normalized_x = (mouse_pos.x / viewport_size.x) * 2 - 1
	var normalized_y = -(mouse_pos.y / viewport_size.y) * 2 - 1
	
	# Calculate the target tilt based on normalized mouse position and max tilt values
	var camera_tilt = Vector3(current_tilt.x + normalized_y * max_tilt, 
							  -current_tilt.y + normalized_x * max_tilt * 0.25, 
							  current_tilt.z)
	
	# Smoothly interpolate camera rotation towards the target tilt to create a smooth transition
	rotation = lerp(rotation, camera_tilt * lerp(1.0, randf_range(1.0, 0.95), delta * 0.8), 10 * delta)
	
	# Update the camera's horizontal (x) and depth (z) positions based on the normalized mouse position
	position.x = lerpf(position.x, current_position.x + normalized_x * max_tilt_pos, 3 * delta)
	position.z = lerpf(position.z, current_position.z + normalized_y * 0.001, 10 * delta)
