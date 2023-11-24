extends Area2D


func _physics_process(delta):
	var Parent_Node = get_parent().get_name()
	
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player":
			#print_debug("end")
			Global.add_score()
			
			if Global.addScore == 3:
				Global.medals[0] += 1
			elif Global.addScore == 2:
				Global.medals[1] += 1
			elif Global.addScore == 1:
				Global.medals[2] += 1
			
			if Parent_Node == "Endless":
				get_tree().change_scene("res://GameOver_endless.tscn")
			else:
				if Parent_Node == "MazeLVL_1":
					Global.FinishedLevel[1] = true
					Global.FinishedLevel[0] = false
				elif Parent_Node == "MazeLVL_2":
					Global.FinishedLevel[2] = true
				elif Parent_Node == "MazeLVL_3":
					Global.FinishedLevel[3] = true
					Global.FinishedLevel[2] = false
				elif Parent_Node == "MazeLVL_4":
					Global.FinishedLevel[4] = true
				elif Parent_Node == "MazeLVL_5":
					Global.FinishedLevel[5] = true
					Global.add_score_bonus()
				elif Parent_Node == "MazeLVL_6":
					Global.FinishedLevel[6] = true
					Global.add_score_bonus()
				get_tree().change_scene("GameOver.tscn")
