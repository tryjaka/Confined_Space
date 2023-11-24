extends Node2D

func _ready():
	$Exit/EntryLock.visible = false

func _physics_process(delta):
	
	if Global.FinishedLevel[0] == true:
		$level_1.set_physics_process(true)
		$level_1/EntryLock.visible = false
	else:
		$level_1.set_physics_process(false)
		
	if Global.FinishedLevel[1] == true:
		$level_2.set_physics_process(true)
		$level_2/EntryLock.visible = false
	else:
		$level_2.set_physics_process(false)
		
	if Global.FinishedLevel[2] == true:
		$level_3.set_physics_process(true)
		$level_3/EntryLock.visible = false
	else:
		$level_3.set_physics_process(false)
		
	if Global.FinishedLevel[3] == true:
		$level_4.set_physics_process(true)
		$level_4/EntryLock.visible = false
	else:
		$level_4.set_physics_process(false)
		
	if Global.FinishedLevel[4] == true:
		$level_5.set_physics_process(true)
		$level_5/EntryLock.visible = false
	else:
		$level_5.set_physics_process(false)
		
	if Global.FinishedLevel[5] == true:
		$level_6.set_physics_process(true)
		$level_6/EntryLock.visible = false
	else:
		$level_6.set_physics_process(false)
		
	if Global.FinishedLevel[6] == true:
		$Endless.set_physics_process(true)
		$Endless/EntryLock.visible = false
	else:
		$Endless.set_physics_process(false)
		
	if Global.Score >= 50:
		$GameEnd/EntryLock.visible = false
