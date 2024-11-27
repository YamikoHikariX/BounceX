extends AudioStreamPlayer


var high = preload("res://Sounds/high.mp3")
var low = preload("res://Sounds/low.mp3")

var is_high_enabled = true
var is_low_enabled = true
var is_flat_enabled = true

enum Tone {
	HIGH,
	LOW,
}

var last_played_tone = Tone.LOW

func _ready() -> void:
	stream = low

func is_enabled():
	return is_high_enabled or is_low_enabled

func play_high():
	stream = high
	play()
	last_played_tone = Tone.HIGH

func play_low():
	stream = low
	play()
	last_played_tone = Tone.LOW
	

func play_marker_sound(frame: int, marker_data: Dictionary) -> void:
	if %Markers.is_frame_marker(frame):
		var curr_marker = marker_data[frame]
		var prev_marker = %Markers.get_previous_marker(frame)
		if prev_marker == null: return
		var prev_marker_depth = prev_marker.depth
		var curr_marker_depth = curr_marker[0]

		if prev_marker_depth < curr_marker_depth:
			if %MarkerSounds.is_high_enabled:
				%MarkerSounds.play_high()
		elif prev_marker_depth > curr_marker_depth:
			if %MarkerSounds.is_low_enabled:
				%MarkerSounds.play_low()
		else:
			if %MarkerSounds.is_flat_enabled:
				match last_played_tone:
					Tone.HIGH:
						%MarkerSounds.play_high()
					Tone.LOW:
						%MarkerSounds.play_low()

