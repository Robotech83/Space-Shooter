extends Node2D



const ENEMY_FOLLOW_1 = preload("res://Scenes/enemy_follow_1.tscn")

@onready var path_2d = $Path2D
@onready var is_wave_done_timer = $is_wave_done_timer

var enemy_amount = 25



func _ready():
	populate_path()
	is_wave_done_timer.start()
	
func populate_path():
	for i in range(enemy_amount):
		var enemy : PathFollow2D = ENEMY_FOLLOW_1.instantiate()
		#this is how you do a timed
		await get_tree().create_timer(0.7).timeout
		path_2d.add_child(enemy)
		#This is how you do it randomly
		#enemy.progress_ratio = randf_range(0.0,1.0)



func _on_is_wave_done_timer_timeout():
	if path_2d.get_child_count() == 0:
		is_wave_done_timer.stop()
