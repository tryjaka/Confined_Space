extends Node


func _ready():
	$SkorText.set_text("Skor : "+str(Global.Score))
	Global.save_game()
