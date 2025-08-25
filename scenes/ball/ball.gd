class_name Ball
extends AnimatableBody2D

enum State {CARRIED, FREEFORM, SHOT}

@export var friction_air : float
@export var friction_ground : float

@onready var animation_player : AnimationPlayer = %AnimationPlayer
@onready var ball_sprite : Sprite2D = %BallSprite
@onready var player_detection_area : Area2D = %PlayerDetectionArea

var current_state : BallState = null
var height := 0.0
var height_velocity := 0.0
var state_factory := BallStateFactory.new()
var velocity := Vector2.ZERO

func _ready():
	switch_state(State.FREEFORM)
	
func _process(delta):
	ball_sprite.position = Vector2.UP * height

func switch_state(state: Ball.State):
	if current_state != null:
		current_state.queue_free()
	current_state = state_factory.get_fresh_state(state)
	current_state.setup(self, player_detection_area, animation_player, ball_sprite)
	current_state.state_transition_requested.connect(switch_state.bind())
	current_state.name = "BallStateMachine"
	call_deferred("add_child", current_state)

func shoot(shot_velocity: Vector2):
	velocity = shot_velocity
	GameState.BallCarrier = null
	switch_state(Ball.State.SHOT)
	
func pass_to(pass_target: Vector2):
	var direction := position.direction_to(pass_target)
	var distance := position.distance_to(pass_target)
	var intensity := sqrt(2 * distance * friction_ground)
	velocity = intensity * direction
	GameState.BallCarrier = null
	switch_state(Ball.State.FREEFORM)
