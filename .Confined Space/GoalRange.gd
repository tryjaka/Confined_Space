extends Area2D

var bodies
var opening_played = false

func _physics_process(delta):
	var goal_in_range = false
	
	bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "Player":
			goal_in_range = true
	
	if goal_in_range == false:
		$AnimatedSprite.play("Closed")
		opening_played = false
	
	if goal_in_range == true && opening_played == false:
		opening_played = true
		$AnimatedSprite.play("Opening")


func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == "Opening" && opening_played == true:
		$AnimatedSprite.play("Opened")
