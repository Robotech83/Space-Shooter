extends Sprite2D

@onready var marker_2d = $Marker2D
@export var bullets_node : Node2D

const BULLET = preload("res://Scenes/bullet.tscn")

var health : int = 100

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	
func _physics_process(delta):
	
	global_position = get_global_mouse_position()
	#print(get_global_mouse_position())

	if Input.is_action_just_pressed("shoot"):
		shoot()

func take_damage(amount):
	health -= amount
	if health <= 0:
		print(health)
		print("You LOSE")
	


func shoot():
	var bullet = BULLET.instantiate()
	bullets_node.add_child(bullet)
	bullet.global_position = marker_2d.global_position
