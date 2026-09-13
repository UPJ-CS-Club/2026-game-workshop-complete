extends Node2D

func _ready() -> void:
	# Register this enemy when it gets loaded
	EnemyMover.instance.register_enemy()

func on_area_entered(area : Area2D) -> void:
	if area.is_in_group("bullet"):
		queue_free() # Delete the enemy node
		area.get_parent().queue_free() # Delete the bullet node
		EnemyMover.instance.unregister_enemy()
	
	if area.is_in_group("border"):
		EnemyMover.instance.queue_flip()
	
	if area.is_in_group("planet"):
		GameManager.instance.lose()
