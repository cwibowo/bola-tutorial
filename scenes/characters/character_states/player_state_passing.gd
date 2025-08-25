class_name PlayerStatePassing
extends PlayerState

func _enter_tree():
	animation_player.stop(true)
	animation_player.animation_finished.connect(on_animation_finish.bind())
	animation_player.play("kick")
	player.velocity = Vector2.ZERO
	
func on_animation_finish(animation_name):
	var pass_target := find_teammate()
	if pass_target == null:
		ball.pass_to(ball.position + player.heading * player.speed)
	else:
		ball.pass_to(pass_target.position + pass_target.velocity)
	transition_state(Player.State.MOVING)
	
func find_teammate() -> Player:
	var players_in_view = teammate_detection_area.get_overlapping_bodies()
	var teammates_in_view := players_in_view.filter(
		func(p: Player): return p != player
	)
	
	teammates_in_view.sort_custom(
		func(p1: Player, p2: Player):
			return p1.position.distance_squared_to(player.position) < p2.position.distance_squared_to(player.position)
	)
	
	if teammates_in_view.size() > 0:
		return teammates_in_view[0]
	
	return null
