#!/bin/bash

# RTSP source with authentication
VIDSOURCE="rtsp://alamat-RTSP-CCTV"

# Audio options (slightly lower bitrate to balance with lower video bitrate)
AUDIO_OPTS="-c:a aac -b:a 96k -ac 2"  # Reduced audio bitrate to 96k

# Video options with 512kbps bitrate and 25fps
VIDEO_OPTS="-s 1280x720 -c:v libx264 -b:v 512k -preset veryfast -g 50 -r 25"

# HLS output settings
OUTPUT_HLS="-hls_time 10 -hls_list_size 5 -hls_delete_threshold 1 -hls_flags delete_segments"

# FFmpeg command
ffmpeg -i "$VIDSOURCE" -y $AUDIO_OPTS $VIDEO_OPTS $OUTPUT_HLS /var/www/html/playlist.m3u8
