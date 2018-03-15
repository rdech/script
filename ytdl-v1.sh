#!/bin/bash

# this is just a script to simplify the use of youtube-dl.. 
# Arguments list:
# -v download video
# -m download only music
# -fm or -fv take the link by the file specified as second argument

if [ "$1"x = -vx ]; then
	echo " --- Your video will be in $HOME/Videos ---"
	cd ~/Videos
	youtube-dl -f 'bestvideo+bestaudio' $2
elif [ "$1"x = -mx ]; then
	echo " --- Your music will be in $HOME/Music ---"
	cd ~/Music
	youtube-dl -f 'bestaudio' -x --audio-quality 0 --audio-format 'mp3' $2
elif [ "$1"x = -fmx ]; then
	echo " --- Your musics will be in $HOME/Music ---"
	cd ~/Music
	while read a; do
		youtube-dl -f 'bestaudio' -x --audio-quality 0 --audio-format 'mp3' $a
	done < $2
elif [ "$1"x = -fvx ]; then
	echo " --- Your videos will be in $HOME/Videos ---"
	cd ~/Videos
	while read a; do
		youtube-dl -f 'bestvideo+bestaudio' $a
	done < $2
else
	echo "error: wrong options.. The avaible options are -v -m -fv -fm"
fi

exit 0
