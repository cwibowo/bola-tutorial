class_name PlayerStateTackling
extends PlayerState

const DURATION_PRE_RECOVERY := 200
const GROUND_FRICTION := 250.0

var is_tackle_complete := false
var time_finish_tackle := Time.get_ticks_msec()

func _enter_tree():
	animation_player.play("tackle")
	
func _process(delta):
	if not is_tackle_complete:
		player.velocity = player.velocity.move_toward(Vector2.ZERO, delta * GROUND_FRICTION)
		if player.velocity == Vector2.ZERO:
			is_tackle_complete = true
			time_finish_tackle = Time.get_ticks_msec()
	if Time.get_ticks_msec() - time_finish_tackle > DURATION_PRE_RECOVERY:
		state_transition_requested.emit(Player.State.RECOVERING)
	
