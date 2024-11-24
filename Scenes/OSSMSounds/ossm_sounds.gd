extends AudioStreamPlayer

const MIN_PITCH = 0.2
const MAX_PITCH = 0.8
const DEPTH_MULTIPLIER = 100

var is_enabled: bool = true

@onready var starting_volume: float = self.volume_db

func simulate_ossm(depth: float, depth_change: float) -> void:
	depth_change = abs(depth_change)
	var pitch = remap(depth_change, 0, 1, MIN_PITCH, MAX_PITCH)
	var volume = starting_volume - 20 + depth_change * DEPTH_MULTIPLIER
	volume = clamp(volume, -40, 20)

	self.volume_db = volume
	self.pitch_scale = pitch
	self.play()
	# print("\n")
	# print("Depth: ", depth*100)
	# print("Depth Change: ", depth_change*100)
	# print("Pitch: ", pitch)
	# print("Volume: ", self.volume_db*100)