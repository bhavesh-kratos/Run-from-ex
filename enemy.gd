extends "res://main.gd"

func _ready():
	$AnimationPlayer.play('enemy_moving')

func _on_Enemy1_body_entered(body):
	if body.name == "Player":
		get_node("/root/main").lives -=1
		queue_free()
	pass
