extends PathFollow2D

@export var speed : float = 0.05

func _physics_process(delta):
	progress_ratio += speed * delta
