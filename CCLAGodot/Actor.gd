# Extends???? What is this inheriting?
extends KinematicBody2D

# Declare class name: what is this?
class_name Actor

# Declare a few things
const FLOOR_NORMAL: = Vector2.UP

# speed and gravity, in pixels
export var speed: = Vector2(300.0, 1000.0)
export var gravity: = 3000.0

# how fast we are moving
var _velocity: = Vector2.ZERO
