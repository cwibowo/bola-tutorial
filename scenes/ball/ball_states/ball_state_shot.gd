class_name BallStateShot
extends BallState

const DURATION_SHOT := 1000
const SHOT_HEIGHT := 5
const SHOT_SPRITE_SCALE := 0.8

var time_since_shot := Time.get_ticks_msec()

func _enter_tree():
	set_ball_animation_from_velocity()
	sprite.scale.y = SHOT_SPRITE_SCALE
	ball.height = SHOT_HEIGHT

func _process(delta):
	if Time.get_ticks_msec() - time_since_shot > DURATION_SHOT:
		state_transition_requested.emit(Ball.State.FREEFORM)
	else:
		move_and_bounce(delta)
	
func _exit_tree():
	sprite.scale.y = 1.0
