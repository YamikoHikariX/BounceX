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

signal marker_toggled(button_pressed: bool, marker: Marker)
signal gui_input(event, marker: Marker)

var mouse_movement: Vector2

func _ready():
	button.toggled.connect(on_button_toggled)
	button.gui_input.connect(on_button_gui_input)

func on_button_toggled(button_pressed: bool):
	marker_toggled.emit(button_pressed, self)

func on_button_gui_input(event):
	gui_input.emit(event, self)