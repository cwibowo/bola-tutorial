class_name PlayerStateShooting
extends PlayerState

func _enter_tree():
	animation_player.stop(true)
	animation_player.animation_finished.connect(on_animation_finished.bind())
	animation_player.play("kick")

func on_animation_finished(_anim_name):
	shoot()
	transition_state(Player.State.RECOVERING)

func shoot():
	ball.shoot(state_data.shot_direction * state_data.shot_power)
