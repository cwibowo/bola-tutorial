class_name BallStateCarried
extends BallState

var carrier: Player = null

func _enter_tree():
	assert(GameState.BallCarrier != null)
	carrier = GameState.BallCarrier
	
func _process(_delta):
	ball.position = carrier.position
	
