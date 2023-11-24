extends Control

func _ready():
	Global.reset()
	Global.load_game()

func _physics_process(delta):
	$SkorText.set_text("CREDS : "+str(Global.Score))
	Global.Fuel = 2000
