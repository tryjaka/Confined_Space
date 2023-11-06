extends Area2D

var hp


func _ready():
	hp = get_node("HPBar")

func _physics_process(delta):
	hp.value = Global.Health

func _on_Timer_timeout():
	#hp.visible = false
	pass

func _on_HP_area_entered(area):
	hp.value = Global.Health
	print("hp on HP = ",hp.value)
	hp.visible = true
	$Timer.start()
