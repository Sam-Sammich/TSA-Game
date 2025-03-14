extends CharacterBody2D


const SPEED = 60.0
const JUMP_VELOCITY = -110.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var coyote_timer: Timer = $CoyoteTimer

var has_double_jump := true


func _physics_process(delta: float) -> void:
	
	# Add the gravity and reset double jump when on ground
	if not is_on_floor():
		velocity += (get_gravity() * delta)/3
	else:
		has_double_jump = true
	
	

	# Handle jump.
	if Input.is_action_just_pressed("Bit-jump"):
		if is_on_floor() or !coyote_timer.is_stopped():
			velocity.y = JUMP_VELOCITY
			coyote_timer.stop()
		elif has_double_jump:
			velocity.y = JUMP_VELOCITY * 0.8
			has_double_jump = false

	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("Bit-left", "Bit-right")
	# face move direction
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
	
	
	
	
	# Play animations
	move_and_slide()
	var verticalDirection = velocity.y
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("cat idle")
		else:
			animated_sprite.play("cat run")
	else:
		if has_double_jump:
			animated_sprite.play("cat jump")
		else:
			animated_sprite.play("cat fall")
	if verticalDirection > 0:
		animated_sprite.play("cat fall")
	if verticalDirection < 0:
		animated_sprite.play("cat jump",.01, true)
	
	
	
	
	# apply movement
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)


	var was_on_floor = is_on_floor()
	move_and_slide()
	if is_on_floor() != was_on_floor && velocity.y >= 0:
		coyote_timer.start()
