class_name PlayerStatePreppingShot
extends PlayerState

const DURATION_MAX_SHOT := 1000.0
const EASE_FACTOR := 1.5

var shot_direction := Vector2.ZERO
var time_start_shoot := Time.get_ticks_msec()

func _enter_tree():
	animation_player.play("prep_kick")
	player.velocity = Vector2.ZERO
	shot_direction = player.heading
	
func _process(delta):
	shot_direction += KeyUtils.get_input_vector(player.control_scheme) * delta
	var press_duration := clampf(Time.get_ticks_msec() - time_start_shoot, 0.0, DURATION_MAX_SHOT)
	
	if press_duration >= DURATION_MAX_SHOT or KeyUtils.is_action_just_released(player.control_scheme, KeyUtils.Action.SHOOT):
		var ease_time := press_duration / DURATION_MAX_SHOT
		var power := ease(ease_time, EASE_FACTOR)
		var shot_power := player.power * power
		shot_direction = shot_direction.normalized()
		var data = PlayerStateData.build().set_shot_power(shot_power).set_shot_direction(shot_direction)
		transition_state(Player.State.SHOOTING, data)
