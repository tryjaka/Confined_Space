extends Control

func _ready():
	Global.load_game()
	print(Global.medals)

func _on_start_pressed():
	get_tree().change_scene("res://Main_Menu.tscn")
	$AudioStreamPlayer.play()

func _on_tutorial_pressed():
	var tutorial_screen = preload("res://Tutorial.tscn").instance()
	$AudioStreamPlayer.playing = true
	add_child(tutorial_screen)

func _on_quit_pressed():
	get_tree().quit()


func _on_reset_pressed():
	$reset/AcceptDialog.popup(Rect2(get_viewport_rect().size.x/2,get_viewport_rect().size.y/2,1,1))


func _on_AcceptDialog_confirmed():
	var dir = Directory.new()
	dir.remove(Global.SAVE_PATH)
	get_tree().quit()


func _on_Stats_pressed():
	var stats_screen = preload("res://Stats.tscn").instance()
	add_child(stats_screen)
