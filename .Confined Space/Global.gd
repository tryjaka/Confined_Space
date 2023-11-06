extends Node

const SAVE_PATH = "user://save_file.save"
var save_data = {}

var Health :int = 100
var MAXFuel :int = 1000
var Fuel :int = 1000
var Score :int = 0
var addScore :int = 3
var FlashlightUpgrade = false
var FixingToolUpgrade = false
var FuelUpgrade = false
var TrapAlert = false
var FinishedLevel = [0,1,2,3,4,5,6,7]

var endless_width = 3
var endless_height = 3

func _ready():
	for i in range(0, FinishedLevel.size()):
		FinishedLevel[i] = false
	FinishedLevel[0] = true

func add_score():
	Score += addScore
	print("Score:",Score)
	
func add_maxfuel():
	MAXFuel += 1000
	print('MaxFuel = ', MAXFuel)

func endless_sizeup():
	endless_width += 1
	endless_height += 1

func endless_reset():
	endless_width = 3
	endless_height = 3

func reset():
	Health = 100
	Fuel = MAXFuel
	addScore = 3
	
func load_game():
	var save_file = File.new()
	if not save_file.file_exists(SAVE_PATH):
		save_data = {"Creds":Score, "Flashlight":FlashlightUpgrade, "FixingTool":FixingToolUpgrade, "Level":FinishedLevel}
		save_game()
	elif save_file.file_exists(SAVE_PATH):
		save_file.open(SAVE_PATH,File.READ)
		save_data = save_file.get_var()
		save_file.close()
		Score = save_data.Creds
		FlashlightUpgrade = save_data.Flashlight
		FixingToolUpgrade = save_data.FixingTool
		FinishedLevel = save_data.Level

func save_game():
	var save_file = File.new()
	save_data.Creds = Score
	save_data.Flashlight = FlashlightUpgrade
	save_data.FixingTool = FixingToolUpgrade
	save_file.open(SAVE_PATH, File.WRITE)
	save_file.store_var(save_data)
	save_file.close()
