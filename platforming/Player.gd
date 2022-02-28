extends KinematicBody2D

const GRAVITY = 900
const MAX_SPEED = 500
const ACCEL = 200
const FRICTION = 1000
const JUMP = -600
var numjumps = 2
var velocity = Vector2.ZERO
var justjumped = false
onready var anim = $AnimatedSprite

func _ready():
	pass

func _process(delta):
	if Input.is_action_pressed('ui_right'):
		velocity.x = move_toward(velocity.x, MAX_SPEED, ACCEL*delta)
		anim.play('walk')
		anim.flip_h = false
	elif Input.is_action_pressed('ui_left'):
		velocity.x = move_toward(velocity.x, -MAX_SPEED, ACCEL*delta)
		anim.play('walk')
		anim.flip_h = true
	else:
		velocity.x = move_toward(velocity.x, 0, FRICTION*delta)
		anim.play('idle')
	
	if Input.is_action_just_pressed('jump') and numjumps > 0 and not justjumped:
		velocity.y = JUMP
		numjumps -= 1
		justjumped = true
		
	if not is_on_floor():
		anim.play('jump')
		justjumped = false
	elif not justjumped:
		numjumps = max(2,numjumps)
		
func _physics_process(delta):
	velocity.y += GRAVITY * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	print(velocity)
