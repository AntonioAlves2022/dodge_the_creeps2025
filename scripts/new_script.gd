extends Area2D
signal hit
# declaração das variáveis
@export var speed:int = 300
var screen_size
# funções do programador

# funções da engine
func _ready() -> void:
	screen_size = get_viewport_rect().size
	# hide() #esconde o player
func _process(delta: float) -> void:
	var velocity = Vector2.ZERO
	if Input.is_action_pressed('move right'):
		velocity.x += 1
	if Input.is_action_pressed('move_left'):
		velocity.x -= 1
	if Input.is_action_pressed('move_up'):
		velocity.y -= 1
	if Input.is_action_pressed('move_down'):
		velocity.y += 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$sprite.play()
	else:
		$sprite.stop()
	position +=velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
	#selecionando as animações do player
	if velocity.x != 0:
		$sprite.animation = "walk"
		$sprite.flip_h = velocity.x < 0
	elif velocity.y != 0:
		$sprite.animation = "up"
		$sprite.flip_v = velocity.y > 0
	else:
		$sprite.flip_h = false
func _on_body_entered(body: Node2D) -> void:
	hide()
	hit.emit()
	$CollisionShape2D.set_deferred("disabled", true)
	
func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
