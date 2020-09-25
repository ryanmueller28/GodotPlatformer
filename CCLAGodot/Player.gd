extends Actor

# if we jump on an enemy, bounce
export var stomp_impulse = 1000.0

# Functions

# Called Every Frame
func _physics_process(delta) -> void:
	# did the player interrupt jumping?
	var is_jump_interrupted: = Input.is_action_just_pressed("jump") and _velocity.y < 0
	
	# get our input
	var direction = get_direction()
	
	# calculate velocity
	_velocity = calculate_move_velocity(_velocity, speed, direction, is_jump_interrupted)
	
	# move
	_velocity = move_and_slide(_velocity, FLOOR_NORMAL)

# Input
func get_direction()-> Vector2:
	return Vector2(Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		-1.0 if Input.is_action_just_pressed("jump") and is_on_floor() else 1.0)

# Did we die?

# Bounce when jump on enemy.

# Caclulate our velocity (or movement speed)
func calculate_move_velocity(linear_velocity: Vector2,
	speed: Vector2,
	direction: Vector2,
	is_jump_interrupted: bool) -> Vector2:
		
		# a return variable, what is this function calculating?
		var new_velocity = linear_velocity
		
		#set x and y for new_velocity equal to speed * direction (x and y)
		new_velocity.x = speed.x * direction.x
		
		new_velocity.y += gravity * get_physics_process_delta_time()
		
		# branch if moving or not
		if direction.y == -1.0:
			new_velocity.y = speed.y * direction.y
		
		# if stopped jumping
		if is_jump_interrupted:
			new_velocity.y = 0.0
		
		return new_velocity

