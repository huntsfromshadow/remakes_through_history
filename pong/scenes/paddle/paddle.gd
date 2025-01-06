extends CharacterBody2D

@export var paddle_speed: float = 300

func _ready():
	pass
	
func _physics_process(_delta):
	
	if !Input.is_anything_pressed():
		return
	else:
		if Input.is_action_pressed("p1_paddle_up"):
			velocity.y = -1 * paddle_speed
			move_and_slide()
		elif Input.is_action_pressed("p1_paddle_down"):
			velocity.y = paddle_speed
			move_and_slide()	
