extends SpotLight3D

var manualFlashlightOn = true
var pulseTimes: Dictionary = {}

func _ready():
	seed("hi there acerola".hash())
	start()

func generate_random_times() -> Dictionary:
	var output: Dictionary = {}
	
	output["wait"] = randf() * 5.0
	output["duration"] = randf() / 3.0
	return output
	
func start():
	pulseTimes = generate_random_times()
	%PulseTimer.start(pulseTimes["wait"])
	
func _on_pulse_duration_timeout():
	if manualFlashlightOn:
		%BasicFlashlight.visible = true
		start()
	
func _on_pulse_timer_timeout():
	if manualFlashlightOn:
		%BasicFlashlight.visible = false
		%PulseDuration.start(pulseTimes["duration"])
		
# Can the chest flashlight be broken?
