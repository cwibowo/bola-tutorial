class_name BallStateFreeform
extends BallState

func _enter_tree():
	GameState.BallCarrier = null
	player_detection_area.body_entered.connect(on_player_enter.bind())
	
func on_player_enter(body: Player):
	GameState.BallCarrier = body
	state_transition_requested.emit(Ball.State.CARRIED)
