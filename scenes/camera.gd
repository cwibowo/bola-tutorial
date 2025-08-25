class_name Camera
extends Camera2D

const DISTANCE_TARGET := 100.0
const SMOOTHING_BALL_CARRIED := 2
const SMOOTHING_BALL_DEFAULT := 8
@export var ball : Ball

func _process(_delta):
	var ballCarrier = GameState.BallCarrier
	if ballCarrier != null:
		position_smoothing_speed = SMOOTHING_BALL_CARRIED
		position = ballCarrier.position + ballCarrier.heading * DISTANCE_TARGET
	else:
		position_smoothing_speed = SMOOTHING_BALL_DEFAULT
		position = ball.position
