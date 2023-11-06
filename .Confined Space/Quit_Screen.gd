extends Control

export (String, FILE, "*.tscn") var next_scene

func _on_Button_pressed():
	get_tree().quit()


func _on_Button2_pressed():
	get_tree().change_scene(next_scene)
