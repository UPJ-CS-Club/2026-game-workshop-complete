class_name GameManager
extends CanvasLayer

static var instance : GameManager
func _enter_tree() -> void:
	instance = self # Singleton
	visible = false # Hide this when the game starts

@export var win_text : Label
@export var lose_text : Label
func _physics_process(delta: float) -> void:
	if !get_tree().paused:
		return
	
	if Input.is_action_just_pressed("fire"):
		get_tree().paused = false
		get_tree().reload_current_scene()

func win() -> void:
	end_game()
	win_text.visible = true

func lose() -> void:
	end_game()
	lose_text.visible = true

func end_game() -> void:
	get_tree().paused = true
	visible = true
