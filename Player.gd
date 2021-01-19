
extends KinematicBody2D
# - Properties
var score :int = 0

var speed: int = 400

var jumpForce : int = 600

var gravity : int = 800

var vel : Vector2 = Vector2()
 
onready var sprite : Sprite = get_node("Sprite")

onready var footStepsAudio = $"AudioEffect/FootStepsAudioPlayer"



func _physics_process(delta):
	vel.x = 0
	
	# - Movement inputs
	if Input.is_action_pressed("move_left"):
		footStepsAudio.play()
		vel.x -= speed
	elif Input.is_action_pressed("move_right"):
		footStepsAudio.play()
		vel.x += speed
	elif Input.is_action_just_released("move_left"):
		footStepsAudio.stop()
	elif Input.is_action_just_released("move_right"):
		footStepsAudio.stop()
		
	# - Applying velocity
	vel = move_and_slide(vel,Vector2.UP)
	# - Gravity
	vel.y +=gravity*delta
	# Jump input
	if Input.is_action_just_pressed("jump") and is_on_floor():
		vel.y -= jumpForce
	if Input.is_action_just_released("jump"):
		footStepsAudio.stop()
		
	# - Sprite direction
	if vel.x < 0:
		sprite.flip_h = true
	elif vel.x > 0:
		sprite.flip_h = false
