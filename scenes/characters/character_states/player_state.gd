class_name PlayerState
extends Node

signal state_transition_requested(new_state: Player.State, state_data: PlayerStateData)

var animation_player : AnimationPlayer = null
var ball: Ball = null
var player: Player = null
var state_data : PlayerStateData = PlayerStateData.new()
var teammate_detection_area : Area2D = null

func setup(context_player: Player, context_data, context_animation_player: AnimationPlayer, context_ball: Ball, context_teammate_detection_area: Area2D):
	player = context_player
	state_data = context_data
	animation_player = context_animation_player
	ball = context_ball
	teammate_detection_area = context_teammate_detection_area

func transition_state(new_state: Player.State, data: PlayerStateData = PlayerStateData.new()):
	state_transition_requested.emit(new_state, data)
