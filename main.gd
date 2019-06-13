extends Node2D

var score = 0 setget set_score
var lives = 3 setget set_lives

func set_score(value):
	score = value
	get_node("/root/main/HUD/score").set_text("SCORE :"+ str(score))

func set_lives(value):
	lives = value
	get_node("/root/main/HUD/lives").set_text("LIVES :"+ str(lives))
	if lives == 0:
		get_tree().change_scene("res://endScene.tscn")