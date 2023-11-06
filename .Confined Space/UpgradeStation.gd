extends Area2D

enum PopUP_ids {
	Fuel #0,
	FixTool
	Flashlight
	test
}

var poppos = Vector2(self.position.x, self.position.y)
onready var PopUP = get_node("PopupMenu")

func _ready():
	PopUP.add_check_item("+Fuel", PopUP_ids.Fuel)
	PopUP.add_check_item("Fixing Tool", PopUP_ids.FixTool)
	PopUP.add_check_item("Flashlight", PopUP_ids.Flashlight)

func _physics_process(delta):
	if Global.FlashlightUpgrade == true:
		PopUP.set_item_checked(2, true)
	if Global.FixingToolUpgrade == true:
		PopUP.set_item_checked(1, true)
	if Global.FuelUpgrade == true:
		PopUP.set_item_checked(0, true)

func _on_UpgradeStation_area_entered(area):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player":
			PopUP.popup(Rect2(poppos.x,poppos.y, 1, 1))


func _on_UpgradeStation_area_exited(area):
	PopUP.hide()

func _on_PopupMenu_id_pressed(id):
	match id:
		PopUP_ids.Fuel:
			if Global.Score >= 2 && Global.FuelUpgrade == false:
				Global.Score -= 2
				Global.add_maxfuel()
				PopUP.set_item_checked(0, true)
				Global.FuelUpgrade = true
				print("Fuel doubled")
			elif Global.FuelUpgrade == true:
				print("Fuel Upgraded")
			else:
				print("not enough Creds")
		PopUP_ids.FixTool:
			if Global.Score >= 2 && Global.FixingToolUpgrade == false:
				Global.Score -= 2
				Global.FixingToolUpgrade = true
				PopUP.set_item_checked(1, true)
				print("added Fix Tool")
			elif Global.FixingToolUpgrade == true:
				print("already have Fixing Tool")
			else:
				print("not enough Creds")
		PopUP_ids.Flashlight:
			if Global.Score >= 2 && Global.FlashlightUpgrade == false:
				Global.Score -= 2
				Global.FlashlightUpgrade = true
				PopUP.set_item_checked(2, true)
				print("added Flashlight")
			elif Global.FlashlightUpgrade == true:
				print("already have flashlight")
			else:
				print("not enough Creds")
