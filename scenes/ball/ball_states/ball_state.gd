class_name  BallState
extends Node

signal state_transition_requested(new_state: Ball.State)

var animation_player : AnimationPlayer = null
var ball : Ball = null
var player_detection_area: Area2D = null

func setup(context_ball: Ball, context_player_detection_area: Area2D, context_animation_player: AnimationPlayer):
	animation_player = context_animation_player
	ball = context_ball
	player_detection_area = context_player_detection_area
