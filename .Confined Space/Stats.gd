extends Control


func _physics_process(delta):
	$GridContainer/gold.set_text("Gold Medals : "+str(Global.medals[0]))
	$GridContainer/silver.set_text("Silver Medals : "+str(Global.medals[1]))
	$GridContainer/bronze.set_text("Bronze Medals : "+str(Global.medals[2]))


func _on_Button_pressed():
	queue_free()
