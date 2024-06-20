extends Node


@export var speed: float = 1

#@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
var sprite: AnimatedSprite2D

var enemy: Enemy

func _ready():
	enemy = get_parent()
	sprite = enemy.get_node("AnimatedSprite2D")
	

func _physics_process(delta: float) -> void:
	#input vector = vector2 que varia entre -1 e 1 em ambos os eixos
	#Calcular Direção
	var player_position = GameManager.player_position
	var difference = player_position - enemy.position
	var input_vector = difference.normalized()
	
	#Movimento
	enemy.velocity = input_vector * speed * 100
	enemy.move_and_slide()
	
	#Girar Sprite
	if input_vector.x > 0:
		sprite.flip_h = false
	elif input_vector.x < 0:
		sprite.flip_h = true
	
