extends Control


func _ready():
	pass


func _on_Button_pressed():
	queue_free()


func _on_Button2_pressed():
	if $Page1.visible == true:
		$Page1.visible = false
		$Page2.visible = true
		$Page3.visible = false
	elif $Page2.visible == true:
		$Page1.visible = false
		$Page2.visible = false
		$Page3.visible = true
	elif $Page3.visible == true:
		$Page1.visible = true
		$Page2.visible = false
		$Page3.visible = false
