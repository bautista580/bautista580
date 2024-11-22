extends CharacterBody2D


@onready var animated_sprite = $AnimatedSprite2D

var isFacingRight = true
#Veloci de movimiento
const SPEED = 130
#Variable global para almacenar el player
var Player = null
#_ready es una función de godot que se ejecuta cuando está cargado totalmente el juego, asegurandonos de que player no sea null cuando lo guardemos
func _ready() -> void:
#Obtener el nodo del jugador
	Player = get_tree().get_nodes_in_group('Player')[0]; # <-- Se hace [0] porque get_nodes_in_group devuelve una lista de nodos, nosotros solo necesitamos el 0, o sea, el primero
	pass
#Funcion que ejecuta para seguir al jugador
func seguir():
	if Player != null:
		velocity = position.direction_to(Player.position) * SPEED
		move_and_slide()
	pass
func flip_x():
	if (isFacingRight and velocity.x < 0) or (not isFacingRight and velocity.x > 0):
		animated_sprite.flip_h = not animated_sprite.flip_h
		isFacingRight = not isFacingRight
	pass
func update_animation():
	if velocity.length() == 0:
		animated_sprite.play("idle")
	else:
		animated_sprite.play("walk")
	pass
	
#_process es una funcion de godot que se ejecuta en cada frame
func _process(_delta: float) -> void:
	update_animation()
	flip_x()
	seguir()
	pass
	
