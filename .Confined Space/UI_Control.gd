extends Control

var Time = 0
var Timer_Active :bool = true

func _ready():
	if Timer_Active:
		$Gold.start()
		$Silver.start()
		$Bronze.start()
		Timer_Active = false

func _physics_process(delta):
	
	
	Time += delta
	$CanvasLayer/Time.set_text("Time : "+str(Time))
	#if Global.Fuel == 0:
		#$CanvasLayer/RichTextLabel2.set_text("Press Esc to restart")
	if Input.is_action_pressed("ui_cancel"):
		get_tree().change_scene("res://Main_Menu.tscn")

func _on_Gold_timeout():
	Global.addScore -= 1
	$CanvasLayer/MedalLabel.set_text("Gold Expired")


func _on_Silver_timeout():
	Global.addScore -= 1
	$CanvasLayer/MedalLabel.set_text("Silver Expired")


func _on_Bronze_timeout():
	Global.addScore -= 1
	$CanvasLayer/MedalLabel.set_text("Bronze Expired")

