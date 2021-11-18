AUDIO = principal_parts.mp3

.PHONY: audio
.PHONY: default

default: title_card/video_title_card.jpg $(AUDIO)
	ffmpeg -loop 1 -f image2 -r 15 -i title_card/video_title_card.jpg -i $(AUDIO) -c:v libx264 -c:a copy -shortest output.mp4

audio: $(AUDIO)
	# 

$(AUDIO): raw/*
	rm -f $(AUDIO)
	vidu cat raw/* $(AUDIO)

title_card/video_title_card.jpg: title_card/video_title_card.png
	convert title_card/video_title_card.png title_card/video_title_card.jpg
