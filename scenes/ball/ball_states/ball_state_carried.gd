class_name BallStateCarried
extends BallState

var carrier: Player = null
var dribble_time := 0.0

const OFFSET_FROM_PLAYER := Vector2(10, 4)
const DRIBBLE_FREQUENCY := 7.0
const DRIBBLE_INTENSITY := 3.0

func _enter_tree():
	assert(GameState.BallCarrier != null)
	carrier = GameState.BallCarrier
	
func _process(delta):
	var variation_x := 0.0
	var variation_y := 0.0
	dribble_time += delta
	
	if (carrier.velocity != Vector2.ZERO):
		if carrier.velocity.x != 0:
			variation_x = cos(dribble_time * DRIBBLE_FREQUENCY) * DRIBBLE_INTENSITY
			
		if carrier.velocity.y != 0:
			variation_y = cos(dribble_time * DRIBBLE_FREQUENCY) * DRIBBLE_INTENSITY / 2
			
		if carrier.heading.x >= 0:
			animation_player.play("roll")
			animation_player.advance(0)
		else:
			animation_player.play_backwards("roll")
			animation_player.advance(0)
	else:
		animation_player.play("idle")
	
	process_gravity(delta)
	ball.position = carrier.position + Vector2(carrier.heading.x * OFFSET_FROM_PLAYER.x + variation_x, OFFSET_FROM_PLAYER.y + variation_y)
	
