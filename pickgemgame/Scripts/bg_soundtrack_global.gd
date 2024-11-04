extends AudioStreamPlayer

var level_music = preload("res://sounds/happy.mp3")

func play_music(music : AudioStream, volume := 0.0):
	if stream == music:
		return
	
	stream = music
	volume_db = volume
	play()

func play_music_level(volume):
	play_music(level_music,volume)
