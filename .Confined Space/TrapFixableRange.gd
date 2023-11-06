extends Area2D

var bodies

func _physics_process(delta):
	var can_fix = false
	
	bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player":
			can_fix = true
			Global.TrapAlert = true
			print("TrapFixableRange = Check")
		else:
			Global.TrapAlert = false
		
	
	if Global.FixingToolUpgrade == true:
		if Input.is_action_pressed("ui_accept") && can_fix == true:
			get_owner().queue_free()
