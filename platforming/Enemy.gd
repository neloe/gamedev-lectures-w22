extends KinematicBody2D

const GRAVITY = 900
const MAX_SPEED = 100
export var direction = -1
export var is_lemming = true

var velocity = Vector2.ZERO

func _ready():
	$CliffDetector.enabled = not is_lemming
	$CliffDetector.position.x = $CollisionShape2D.shape.get_extents().x * direction
	if is_lemming:
		set_modulate(Color(.5, 1, .5))
	
func turn_around():
	direction *= -1
	$CliffDetector.position.x *= -1
	
func _physics_process(delta):
	if is_on_wall() or (not is_lemming and not $CliffDetector.is_colliding()):
		turn_around()
	velocity.y += GRAVITY * delta
	velocity.x = MAX_SPEED * direction
	velocity = move_and_slide(velocity, Vector2.UP)
