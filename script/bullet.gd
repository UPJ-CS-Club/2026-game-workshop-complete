extends Node2D

@export var move_speed = 20.0

func _physics_process(delta: float) -> void:
	position += Vector2.UP * move_speed
