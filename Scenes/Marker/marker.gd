extends Node2D
class_name Marker

@onready var button: TextureButton = %Button
@onready var selected: TextureRect = %Selected

var frame: int:
    get():
        return get_meta("frame", 0)