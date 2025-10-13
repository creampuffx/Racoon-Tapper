extends Label

func _process(delta):
	self.text = "SCORE: " + str(Global.SCORE)
