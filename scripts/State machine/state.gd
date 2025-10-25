@icon("res://scripts/State machine/icons/state.svg")
extends Node
class_name State

func _ready():
	print(name," initialised")

func enter():
	print(name, " entered")
	
func process(delta) -> State:
	return null
	
func physics(delta) -> State:
	return null

func input(event) -> State:
	return null
	
func exit():
	print(name, " exited")
