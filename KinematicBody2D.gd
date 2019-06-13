extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
var motion = Vector2()
const UP = Vector2(0,-1) 

#signal hit
export  var x_speed = 300
export var gravity = 10
const SMOOTHNESS = 0.2
var jump_speed = -500
var direction = 0
#var pos_player

#onready var sprite = get_node("BoyLeft")

#var jump_only = preload("res://png/Jump (5).png")
#var jump_with_direction = preload("res://png/Jump (6).png")
#var running = preload("res://png/Run (11).png")
#var idle = preload("res://png/Idle (1).png")

func _ready():
	hide()

# Callphed when the node enters the scene tree for the first time.
func _physics_process(delta):
	show()
	# print(sprite.get_texture())
	motion.y += gravity
	if Input.is_action_pressed("ui_right"):
		direction = 1
		$AnimatedBoy.set_flip_h(false)

#		motion.y = 0
	elif Input.is_action_pressed("ui_left"):
		direction = -1		
		$AnimatedBoy.set_flip_h(true)

	else: 
		direction = 0
		
	
	motion.x = lerp(motion.x, x_speed * direction, SMOOTHNESS)
	
	if is_on_floor():
#		if sprite.get_texture() == jump_with_direction:
#			sprite.set_texture(running)
		
		if direction == 0:
			$AnimatedBoy.play("idle")
		else:
			$AnimatedBoy.play("run")		
		
		if Input.is_action_just_pressed("ui_up"):
			motion.y = jump_speed
	
	if !is_on_floor():
		if Input.is_action_pressed("ui_left") || Input.is_action_pressed("ui_right"):
			$AnimatedBoy.play("directional_jump")
		else:
			$AnimatedBoy.play("jump")
		# if Input.is_action_just_released("ui_left") || Input.is_action_just_released("ui_right"):
			
			
		
		
	move_and_slide(motion, UP)
#		motion.y = 0
#	elif Input.is_action_just_pressed("ui_up"):
#		motion.y = -100
#		motion.x = 0
#	elif Input.is_action_just_pressed("ui_down"):
#		motion.y = 100
#		motion.x = 0	

	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
