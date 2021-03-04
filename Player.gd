extends KinematicBody2D

var score : int = 0

var speed : int = 200
var jumpForce : int = 1000
var gravity : int = 2000

var vel : Vector2 = Vector2()

onready var sprite : Sprite = get_node("Sprite")

func _physics_process(delta):
	
	vel.x = 0
	
	#movement inputs
	if Input.is_action_pressed("move_Left"):
		vel.x -= speed
	if Input.is_action_pressed("move_Right"):
		vel.x = speed
	
	#applying velocity
	vel = move_and_slide(vel, Vector2.UP)
	
	#gravity
	vel.y = gravity * delta
	
	#jump input
	if Input.is_action_just_pressed("jump"):
		vel.y -=jumpForce
	
	#sprite direction
	if vel.x < 0:
		sprite.flip_h = true;
	elif vel.x > 0:
		sprite.flip_h = false;
		
