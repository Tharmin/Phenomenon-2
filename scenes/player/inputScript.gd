extends MultiplayerSynchronizer

# Set via RPC to simulate is_action_just_pressed.
@export var jumping := false

# Synchronized property.
@export var direction := Vector2()
@export var Camera := Vector2()
var mouse_motion = true #this is the inverse of it's name
#It's bc I don't wanna put a "not"

func _ready():
	# Only process for the local player.
	set_process(get_multiplayer_authority() == multiplayer.get_unique_id())


@rpc("call_local")
func jump():
	jumping = true
	

func _input(event):
	if event is InputEventMouseMotion:
		mouse_motion = false
		Camera = event.relative


func _process(delta):
	if mouse_motion: #this is where I didn't want to put a "not"
		Camera = Vector2()
	else:
		mouse_motion = true #forces it to wait a frame before setting.
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if Input.is_action_just_pressed("ui_accept"):
		jump.rpc()

func pause():
	Camera = Vector2()
	direction = Vector2()
