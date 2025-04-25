extends Node
@export var mob_scene: PackedScene
var score


func game_over() -> void:
	$scoreTimer.stop()
	$mobTimer.stop()
	

func new_game()-> void:
	score = 0
	$Player.start($startPosition.position)
	$startTimer.start()


func _on_mob_timer_timeout() -> void:
	'''
	Cria na memória do computador uma
	cópia do mob (inimigo)
	'''
	var mob = mob_scene.instantiate()
	
	'''
	Vamos definir uma posição aleatória
	para colocar o mob na tela do jogo
	'''
	var mob_span_location = $mobPath/mobSpawnLocation
	mob_span_location.progress_ratio = randf()
	
	'''
	Define a posição inicial do mob na tela
	'''
	mob.position = mob_span_location.position
	
	'''
	Definir a direção do mob para que 
	ele fique perpendicular a linha do caminho
	'''
	var direction = mob_span_location.rotation + PI/2
	direction += randf_range(-PI/4, PI/4)
	mob.rotation = direction
	
	'''
	Definindo uma velocidade aleatória
	para o mob
	'''
	var velocity = Vector2(randf_range(150,250),0.0)
	mob.linear_velocity = velocity.rotated(direction)
	add_child(mob)
	
	
	
	


func _on_start_timer_timeout() -> void:
	$mobTimer.start()
	$scoreTimer.start()


func _on_score_timer_timeout() -> void:
	score +=1

func _ready() -> void:
	new_game()
