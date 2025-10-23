extends Panel

func _process(float):
	$Label.text = "level " + str(Global.level)
