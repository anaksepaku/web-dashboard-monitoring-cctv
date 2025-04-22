cctv monitoring dashboard sederhana di jaringan lokal

perangkat yang di butuhkan
- server ubuntu atau debian
- cctv yang support RTSP

install nginx 
- sudo apt update
- sudo apt install nginx


install FFmpeg di server

- sudo apt update
- sudo apt install ffmpeg


 upload file index.html ke /var/www/html/
 - edit file index html pada bagian script input kan url ( IP address SERVER )
 - 
  <script>
  // Configuration
  const cameraConfigs = {
  'camera1': {
  url: 'http://ipaddressServer/playlist.m3u8',
  name: 'CCTV SIMPANG RT 11',
  resolution: '1280x720',
  fps: 25
  },





   # Konfigurasi Multiple CCTV
   edit url nya dengan contoh

  - url: 'http://ipaddresServer/camera1/playlist.m3u8',
  - url: 'http://ipaddresServer/camera2/playlist.m3u8',
    dan seterusnya.


    

   # Cara Menggunakan:
    - Simpan script sebagai  livestreming.sh atau multi_stream.sh
   - Berikan permission eksekusi: chmod +x  file scrip .sh nya
   - Jalankan: ./livestreming.sh atau ./multi_stream.sh
   - Untuk menjalankan di background: nohup ./multi_stream.sh  &
   - Untuk menjalankan di background: nohup ./livestreming.sh  &
  
