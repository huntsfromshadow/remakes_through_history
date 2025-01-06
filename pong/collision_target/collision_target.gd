extends Area2D

@export var goal_name: String = "Replace Me"

signal ball_hit_goal(goal_name)

func _on_body_entered(body):
	var b = body as CharacterBody2D
	if b.name == "Ball":
		ball_hit_goal.emit(goal_name)
