extends Area2D


func _ready():
	pass


func _on_Item_Fuel_area_entered(area):
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player":
			if Global.Fuel < Global.MAXFuel:
				Global.Fuel = Global.MAXFuel
			else:
				print("fuel full")
			if Global.Health < 100:
				Global.Health += 25
			else:
				print("health full")
			print("Max fuel now = ", Global.MAXFuel)
			print("Fuel now = ",Global.Fuel)
			print("HP now = ", Global.Health)
		print("Item_Fuel:",Global.Fuel)
