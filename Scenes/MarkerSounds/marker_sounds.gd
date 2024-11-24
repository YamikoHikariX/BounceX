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
	self.stream = low

func is_enabled():
	return is_high_enabled or is_low_enabled

func play_high():
	self.stream = high
	self.play()

func play_low():
	self.stream = low
	self.play()

func play_marker_sound(frame: int, marker_data: Dictionary) -> void:
	if %Markers.is_frame_marker(frame):
		var curr_marker = marker_data[frame]
		var prev_marker = %Markers.get_previous_marker(frame)
		if prev_marker == null: return
		var prev_marker_depth = prev_marker.get_meta("depth")
		var curr_marker_depth = curr_marker[0]

		if %MarkerSounds.is_high_enabled and prev_marker_depth < curr_marker_depth:
			%MarkerSounds.play_high()
		elif %MarkerSounds.is_low_enabled and prev_marker_depth > curr_marker_depth:
			%MarkerSounds.play_low()
		
		if %MarkerSounds.is_flat_enabled:
			match last_played_tone:
				Tone.HIGH:
					%MarkerSounds.play_high()
				Tone.LOW:
					%MarkerSounds.play_low()