extends CharacterBody2D

@export var mov_speed = 140
@onready var animated_sprite = $AnimatedSprite2D

var isFacingRight = true
var isMovingY = false
var isMovingUp = false

func checkDoorLevel1():
	var input_axis = Input.get_axis('puerta','puertota')
	if input_axis != 0:
		# Emitir señal a todas las puertas en el grupo, pasando la posición del jugador
		get_tree().call_group('puertas', 'on_player_interaction', global_position)

func checkMovingY():
	if velocity.y != 0:
		isMovingY = true
		isMovingUp = velocity.y < 0
	else:
		isMovingY = false
		isMovingUp = false

func horizontalMovement():
	var input_axis = Input.get_axis("ui_left", "ui_right")
	velocity.x = input_axis * mov_speed

func flip_x():
	if (isFacingRight and velocity.x < 0) or (not isFacingRight and velocity.x > 0):
		scale.x *= -1
		isFacingRight = not isFacingRight

func verticalMovement():
	var input_axis = Input.get_axis("ui_up", "ui_down")
	velocity.y = input_axis * mov_speed

func update_animation():
	if velocity.length() == 0:
		animated_sprite.play("idle")
	else:
		animated_sprite.play("run")

func _physics_process(_delta):
	# Llamar a checkDoorLevel1 para verificar interacción con puerta
	checkDoorLevel1()
	
	checkMovingY()
	horizontalMovement()
	verticalMovement()
	flip_x()
	update_animation()
	
	move_and_slide()
