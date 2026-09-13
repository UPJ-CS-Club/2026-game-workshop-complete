extends Node2D

# Player's movement speed.
@export var move_speed = 5.0
# Left edge of the screen.
@export var left_bound = 50
# Right edge of the screen.
@export var right_bound = 750

# Reference to the scene we instance when spawning bullets.
@export var bullet_scene : PackedScene
# Reference to the node that determines the bullet's spawn position.
@export var muzzle_position : Node2D

func _physics_process(delta: float) -> void:
	# 1. Get the horizontal input
	var input = Input.get_axis("left", "right")
	# 2. Move the player
	var horizontal_pos = position.x
	horizontal_pos += input * move_speed
	# 3. Clamp the movement
	horizontal_pos = clamp(horizontal_pos, left_bound, right_bound)
	position = Vector2(horizontal_pos, position.y)
	
	# Check for fire input
	if Input.is_action_just_pressed("fire"):
		# Spawn our bullet
		var new_bullet = bullet_scene.instantiate()
		get_tree().root.add_child(new_bullet)
		new_bullet.global_position = muzzle_position.global_position
