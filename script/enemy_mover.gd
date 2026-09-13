class_name EnemyMover
extends Node2D

static var instance : EnemyMover
func _enter_tree() -> void:
	instance = self # Singleton

@export var move_speed = 2.0
@export var advance_interval = 16.0
var is_moving_right = true
var is_flip_queued = false

func _physics_process(delta: float) -> void:
	if is_flip_queued:
		flip_direction()
	
	if is_moving_right:
		position += Vector2.RIGHT * move_speed
	else:
		position += Vector2.LEFT * move_speed

func flip_direction() -> void:
	is_flip_queued = false
	is_moving_right = !is_moving_right
	position += Vector2.DOWN * advance_interval

func queue_flip() -> void:
	is_flip_queued = true


var enemy_count = 0 # Represents the number of enemies remaining

func register_enemy() -> void:
	enemy_count += 1 # Register an enemy as alive

func unregister_enemy() -> void:
	enemy_count -= 1 # Reduce the number of enemies left
	if enemy_count <= 0: # Check if the game is done
		GameManager.instance.win()
