#!/bin/bash

# Direktori output
OUTPUT_DIR="/www/wwwroot/cctv.test"

# Daftar CCTV dengan konfigurasi masing-masing
declare -A CCTV_CONFIGS=(
    # Format: [nama_stream]="rtsp_url resolusi bitrate fps"
    ["camera1"]="rtsp://admin:sai241297@172.16.0.200:554/cam/realmonitor?channel=1&subtype=0 1280x720 512k 25"
    ["camera2"]="rtsp://admin:sai241297@172.16.0.201:554/cam/realmonitor?channel=1&subtype=0 1280x720 512k 25"
    ["camera3"]="rtsp://admin:sai241297@172.16.0.202:554/cam/realmonitor?channel=1&subtype=0 1024x576 384k 20"
    ["camera4"]="rtsp://admin:sai241297@172.16.0.203:554/cam/realmonitor?channel=1&subtype=0 1920x1080 1024k 30"
)

# Fungsi untuk memulai stream
start_stream() {
    local stream_name=$1
    local rtsp_url=$2
    local resolution=$3
    local bitrate=$4
    local fps=$5
    
    # Audio options
    local AUDIO_OPTS="-c:a aac -b:a 96k -ac 2"
    
    # Video options
    local VIDEO_OPTS="-s $resolution -c:v libx264 -b:v $bitrate -preset veryfast -g $((fps*2)) -r $fps"
    
    # HLS output settings
    local OUTPUT_HLS="-hls_time 10 -hls_list_size 5 -hls_delete_threshold 1 -hls_flags delete_segments"
    
    # Buat direktori untuk stream jika belum ada
    mkdir -p "$OUTPUT_DIR/$stream_name"
    
    echo "Starting $stream_name stream..."
    ffmpeg -i "$rtsp_url" -y $AUDIO_OPTS $VIDEO_OPTS $OUTPUT_HLS "$OUTPUT_DIR/$stream_name/playlist.m3u8" 2>> "$OUTPUT_DIR/$stream_name/ffmpeg.log" &
}

# Fungsi untuk memeriksa dan merestart stream yang mati
monitor_streams() {
    while true; do
        for stream_name in "${!CCTV_CONFIGS[@]}"; do
            if ! pgrep -f "ffmpeg.*$stream_name/playlist.m3u8" > /dev/null; then
                echo "Stream $stream_name is down, restarting..."
                IFS=' ' read -r rtsp_url resolution bitrate fps <<< "${CCTV_CONFIGS[$stream_name]}"
                start_stream "$stream_name" "$rtsp_url" "$resolution" "$bitrate" "$fps"
            fi
        done
        sleep 10
    done
}

# Main execution
for stream_name in "${!CCTV_CONFIGS[@]}"; do
    IFS=' ' read -r rtsp_url resolution bitrate fps <<< "${CCTV_CONFIGS[$stream_name]}"
    start_stream "$stream_name" "$rtsp_url" "$resolution" "$bitrate" "$fps"
done

# Mulai monitoring
monitor_streams &
