 # cctv monitoring dashboard sederhana di jaringan lokal

perangkat yang di butuhkan
- server ubuntu atau debian
- cctv yang support RTSP

install nginx 
 
    # sudo apt update
 
    # sudo apt install nginx


install FFmpeg di server

    # sudo apt update
    # sudo apt install ffmpeg


 upload file index.html ke /var/www/html/
 - edit file index html pada bagian script input kan url ( IP address SERVER )
 - 
 [ <script>
  // Configuration
  const cameraConfigs = {
  'camera1': {
  url: 'http://ipaddressServer/playlist.m3u8',
  name: 'CCTV SIMPANG RT 11',
  resolution: '1280x720',
  fps: 25
  }, ]





   # Konfigurasi Multiple CCTV
   edit url nya dengan contoh

  - url: 'http://ipaddresServer/camera1/playlist.m3u8',
  - url: 'http://ipaddresServer/camera2/playlist.m3u8',
    dan seterusnya.


    

   # Cara Menggunakan:
   edit file script nya 
   - masukan alamat RTSP CCTV pada baris

     # satu alamat RSTP saja    
 
          # RTSP source with authentication
          VIDSOURCE="rtsp://alamatRSTP"



     # Daftar CCTV dengan konfigurasi masing-masing ( multiple-camera)
    declare -A CCTV_CONFIGS=(
    # Format: [nama_stream]="rtsp_url resolusi bitrate fps"
    ["camera1"]="rtsp://alamatRTSP 1280x720 512k 25"
    ["camera2"]="rtsp://alamtRTSP 1280x720 512k 25"
    dan seterusnya 



   
   Simpan script sebagai  livestreming.sh atau multi_stream.sh
   Berikan permission eksekusi:
   
     chmod +x livestreming.sh
     chmod +x multi_strem.sh
   Jalankan: 
    
    ./livestreming.sh
    ./multi_stream.sh
    
   Untuk menjalankan di background: 
   
     nohup ./multi_stream.sh  &
     nohup ./livestreming.sh  &
  
