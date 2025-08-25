class_name Goal
extends Node2D

@onready var back_net_area := %BackNetArea

func _ready():
	back_net_area.body_entered.connect(on_ball_enter_back_net.bind())
	
func on_ball_enter_back_net(ball: Ball):
	ball.stop()
