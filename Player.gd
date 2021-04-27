extends KinematicBody2D


export (float) var GRAVITY = 600.0
const WALK_FORCE = 600
const WALK_MAX_SPEED = 200
const STOP_FORCE = 1300
export (float) var JUMP_SPEED = 400

var velocity = Vector2()
var inputVector = Vector2()
var isJumping = false;

func get_input():
	inputVector = Vector2()
	#if (wasOnGround):
	inputVector.x = Input.get_action_strength("right") -  Input.get_action_strength("left")
	

func _physics_process(delta):
	get_input()
	velocity.y += delta * GRAVITY;
	if abs(inputVector.x * WALK_FORCE) < WALK_FORCE * 0.2:
		# The velocity, slowed down a bit, and then reassigned.
		velocity.x = move_toward(velocity.x, 0, STOP_FORCE * delta)
	else:
		velocity.x += WALK_FORCE * inputVector.x * delta
		
	velocity.x = clamp(velocity.x, -WALK_MAX_SPEED, WALK_MAX_SPEED)

	velocity = move_and_slide(velocity, Vector2(0, -1))
	if is_on_floor() and Input.is_action_just_pressed("jump"):
		velocity.y = -JUMP_SPEED
