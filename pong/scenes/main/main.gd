extends Node2D

@onready var p_1_paddle = $P1_Paddle
@onready var p_1_goal = $P1_Goal
@onready var p_2_goal = $P2_Goal

@export var ball_start_pnt: Vector2 = Vector2(595, 307)

func _ready():
	pass

func _on_p_2_goal_ball_hit_goal(goal_name):
	print(goal_name)

func _on_p_1_goal_ball_hit_goal(goal_name):
	print(goal_name)
