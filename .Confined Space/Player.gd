extends KinematicBody2D

const SPD = 50
const RotSPD = 150
var velocity = Vector2()
var Fuel
var zoomout = 0
const zoom = 0.5
var paused = false

func _ready():
	rotation = PI
	rotation_degrees = 0
	$Camera2D.set_zoom(Vector2(zoom, zoom))

func _process(delta):
	var Sprite = $AnimatedSprite
	var flashlight = $Lights/centerLight
	var dirlight = [$Lights/dirLight, $Lights/dirLight2]
	Fuel = get_node("RocketFuel")
	Fuel.value = Global.Fuel
	zoomout = clamp(zoomout, zoom, 1)
	
	if Global.TrapAlert == true:
		$TrapIndicator.visible = true
	elif Global.TrapAlert == false:
		$TrapIndicator.visible = false
	
	if Input.is_action_pressed("ui_focus_next"):
		zoomout += 0.01
		$Camera2D.set_zoom(Vector2(zoomout, zoomout));
		if zoomout == 1.01:
			paused = true
	elif Input.is_action_just_released("ui_focus_next"):
		paused = false
		zoomout = zoom
		$Camera2D.set_zoom(Vector2(zoomout, zoomout));
	
	if Global.FlashlightUpgrade == true:
		if Input.is_action_just_pressed("ui_flashlight") && flashlight.enabled == false:
			flashlight.enabled = true
		elif Input.is_action_just_pressed("ui_flashlight") && flashlight.enabled == true:
			flashlight.enabled = false
		if Input.is_action_just_pressed("ui_flashlight") && dirlight[0].enabled == false && dirlight[1].enabled == false:
			dirlight[0].enabled = true
			dirlight[1].enabled = true
		elif Input.is_action_just_pressed("ui_flashlight") && dirlight[0].enabled == true  && dirlight[1].enabled == true:
			dirlight[0].enabled = false
			dirlight[1].enabled = false
	
	if Input.is_action_pressed("ui_left") && paused == false:
		rotation_degrees -= RotSPD * delta;
		Sprite.play("TurnL")
	elif Input.is_action_just_released("ui_left") && paused == false:
		Sprite.play("TurnL_r")
	elif Input.is_action_pressed("ui_right") && paused == false:
		rotation_degrees += RotSPD * delta;
		Sprite.play("TurnR")
	elif Input.is_action_just_released("ui_right") && paused == false:
		Sprite.play("TurnR_r")
		
	if Fuel.value > 0:
		if Input.is_action_pressed("ui_up") && paused == false:
			velocity = Vector2(0, -1).rotated(rotation) * SPD
			Global.Fuel -= 5
			Sprite.play("Forward")
		elif Input.is_action_just_released("ui_up"):
			Sprite.play("Forward_r")
			#print("fuel =",Global.Fuel)
			#print("MAX fuel =",Global.MAXFuel)
		if Input.is_action_pressed("ui_down") && paused == false:
			velocity = Vector2(0, 1).rotated(rotation) * (SPD - 25)
			Global.Fuel -= 2
			
	velocity = move_and_slide(velocity)



func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == "TurnL_r" || $AnimatedSprite.animation == "TurnR_r" || $AnimatedSprite.animation == "Forward_r":
		$AnimatedSprite.play("Idle")
