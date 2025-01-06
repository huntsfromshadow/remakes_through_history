extends CharacterBody2D

@export var ball_speed = 800

@export var current_x_direc: float = 0
@export var current_y_direc: float = 0

func _ready():
	# Get us an iniital direc
	current_x_direc = randf_range(-1, 1)
	current_y_direc = randf_range(-1, 1)
	#current_x_direc = -1
	#current_y_direc = .01
	velocity = Vector2(current_x_direc * ball_speed, current_y_direc * ball_speed)
	
func _physics_process(_delta):
	var pre_move_v = velocity
	# Always move us
	move_and_slide()
	
	# Handle collision	
	if (get_slide_collision_count() > 0):		
		# We only care about the first
		var col = get_slide_collision(0)
		if col.get_collider() is TileMapLayer:
			var n = col.get_normal()
			# correct velcoity from collision
			velocity = pre_move_v
			
			# Top or Bottom Wall Collision
			if n.x == 0 && (n.y == -1 || n.y == 1):
				velocity.y = velocity.y * -1				
			elif (n.x == 1 || n.x == -1) && n.y == 0:
				velocity.x = velocity.x * -1
			else:
				var err = "Normal is confusing %s" % n
				assert(false, err)	
			return
		else:
			# So we are hitting paddle
			velocity = pre_move_v
			velocity.x = velocity.x * -1
			velocity.y = velocity.y * -1
			return
		

	
