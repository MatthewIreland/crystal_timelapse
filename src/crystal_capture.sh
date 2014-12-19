#!/bin/bash

cd /home/matthew/crystal_shots

while :
do
    filename=$(date -I'seconds')

    # take 3 frames to give webcam time to initialise
    # watch led on webcam for success indication
    mplayer tv:// -tv driver=v4l2:width=1920:height=1080:outfmt=i420:norm=PAL:device=/dev/video0:input=0:fps=10 -vo png -frames 3

    # delete the first two
    rm 00000001.png 00000002.png

    # rename the third
    mv 00000003.png ${filename}.png
    
    sleep 8.5s
done

