extends Area2D



var damage = 10
var speed = 150


func _physics_process(delta):
	global_position = global_position + Vector2.DOWN * delta * speed

func _on_timer_timeout():
	queue_free()
	


func _on_area_entered(area):
	if area.is_in_group("shield"):
		#print("Hit Player")
		var shield = area.get_parent()
		shield.take_damage(damage)
