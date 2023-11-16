extends Area2D

export (String, FILE, "*.tscn") var next_scene


func _physics_process(delta):
	var bodies = get_overlapping_bodies()
	if Input.is_action_pressed("ui_accept") && Global.Score >= 50:
		for body in bodies:
			if body.name == "Player":
				get_tree().change_scene(next_scene)
