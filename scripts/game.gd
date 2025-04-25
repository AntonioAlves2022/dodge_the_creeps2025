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
	pass # Replace with function body.


func _on_start_timer_timeout() -> void:
	pass # Replace with function body.


func _on_score_timer_timeout() -> void:
	pass # Replace with function body.
