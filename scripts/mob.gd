extends RigidBody2D

func _ready() -> void:
	var mob_types = Array($sprite.sprite_frames.get_animation_names())
	$sprite.animation = mob_types.pick_random()
	
	
func _on_notifier_screen_exited() -> void:
	queue_free()
