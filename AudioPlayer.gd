extends AudioStreamPlayer

const level_music = preload("res://Audio/Music/GODDESS OF VICTORY NIKKE OST - Outpost Theme (Extended).mp3")

func _play_music(music: AudioStream, volume = -25.0):
	if stream == music:
		return
	
	stream = music
	volume_db = volume
	play()
	
func play_music_level():
	_play_music(level_music)
