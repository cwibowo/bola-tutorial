class_name BallStateFactory

var states : Dictionary

func _init():
	states = {
		Ball.State.CARRIED: BallStateCarried,
		Ball.State.FREEFORM: BallStateFreeform,
		Ball.State.SHOT: BallStateShot
	}
	
func get_fresh_state(state: Ball.State):
	assert(states.has(state), "state doesn't exist!")
	return states.get(state).new()
