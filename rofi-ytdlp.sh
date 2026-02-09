#!/bin/bash

# I don't think this is a final form of the script(of course it isn't)


# This function for checking if user abort the program using esc or not
escaped_or_not(){
    # -z to check if it's empty or not
    if [[ -z "$1" ]]; then
        echo "exit..."
        exit 0
    fi
}

#Video URL
url=$(rofi -dmenu -p "Enter Video URL:")
escaped_or_not $url;


# choose the desiered format
format=$(echo -e "mp4\nmp3" | rofi -dmenu -p "yt-dlp choose file format (mp4 or mp3)")
escaped_or_not $format;

# where to save
location=$(echo -e "/home/$USER/Media/Videos\n/home/$USER/Downloads" | rofi -dmenu -p "yt-dlp where to save file")
escaped_or_not $location;
# Set format structure to use it 
if [[ "$format" == "mp4" ]]; then
    options="-f bestvideo+bestaudio/best --merge-output-format mp4"
else [[ "$format" == "mp3" ]]
    options="-x --audio-format mp3"
fi


# Download command
yt-dlp $options "$url" -P $location
