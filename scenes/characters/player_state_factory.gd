class_name PlayerStateFactory

var states: Dictionary

func _init():
	states = {
		Player.State.MOVING: PlayerStateMoving,
		Player.State.TACKLING: PlayerStateTackling,
		Player.State.RECOVERING: PlayerStateRecovering
	}
	
func get_fresh_state(state: Player.State) -> PlayerState:
	assert(states.has(state), "state does not exist!")
	return states.get(state).new()
