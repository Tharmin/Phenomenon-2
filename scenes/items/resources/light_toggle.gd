extends SpotLight3D

# what does a light need to do?
# - be toggleable
# - flicker
# 

func toggle_light():
	self.visible = !self.visible
