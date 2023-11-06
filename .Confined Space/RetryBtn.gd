extends Button

export (String, FILE, "*.tscn") var next_scene

func _on_Button_pressed():
	Global.reset()
	Global.endless_reset()
	get_tree().change_scene(next_scene)
	pass # Replace with function body.
