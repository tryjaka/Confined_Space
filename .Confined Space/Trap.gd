extends Area2D

var areas

func _on_Trap_area_entered(area):
	areas = get_overlapping_areas()
	for area in areas:
		if area.name == "HP":
			Global.Health -= 25
		#print("TrapHP:",Global.Health)
		if Global.Health == 0:
			get_tree().change_scene("res://GameOver.tscn")
	pass # Replace with function body.
