extends PanelContainer

func _ready() -> void:
	%High.toggled.connect(toggle_high)
	%Low.toggled.connect(toggle_low)
	%Flat.toggled.connect(toggle_flat)
	%OSSM.toggled.connect(toggle_ossm)

	%MusicVolumeSlider.value = db_to_linear(%AudioStreamPlayer.volume_db)
	%OSSMVolumeSlider.value = db_to_linear(%OSSMSounds.starting_volume)
	%MarkerVolumeSlider.value = db_to_linear(%MarkerSounds.volume_db)

	%MusicVolumeSlider.value_changed.connect(update_music_volume)
	%OSSMVolumeSlider.value_changed.connect(update_ossm_volume)
	%MarkerVolumeSlider.value_changed.connect(update_marker_volume)

	%MusicVolumeSlider.value = 0.1

	%High.button_pressed = false
	%Low.button_pressed = false
	%Flat.button_pressed = false
	%OSSM.button_pressed = false

func toggle_high(enabled: bool) -> void:
	%MarkerSounds.is_high_enabled = enabled

func toggle_low(enabled: bool) -> void:
	%MarkerSounds.is_low_enabled = enabled

func toggle_flat(enabled: bool) -> void:
	%MarkerSounds.is_flat_enabled = enabled

func toggle_ossm(enabled: bool) -> void:
	%OSSMSounds.is_enabled = enabled

func update_music_volume(volume: float) -> void:
	%AudioStreamPlayer.volume_db = linear_to_db(volume)

func update_ossm_volume(volume: float) -> void:
	%OSSMSounds.starting_volume = linear_to_db(volume)

func update_marker_volume(volume: float) -> void:
	%MarkerSounds.volume_db = linear_to_db(volume)