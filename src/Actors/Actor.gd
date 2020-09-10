extends KinematicBody2D

#declare class name
class_name Actor

const FLOOR_NORMAL: = Vector2.UP

export var speed: = Vector2(300.0, 1000.0)
export var gravity: = 3000.0 # in Pixels, 

var _velocity: = Vector2.ZERO # Vector2 (pixelCountX, pixelCountY)
