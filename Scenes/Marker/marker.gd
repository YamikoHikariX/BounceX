extends Node2D
class_name Marker

@onready var button: TextureButton = %Button
@onready var selected: TextureRect = %Selected

var frame: int
var depth: float
var trans: int
var ease: int
var auxiliary: int
var line: Line2D