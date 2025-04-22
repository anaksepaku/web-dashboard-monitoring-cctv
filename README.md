cctv monitoring dashboard sederhana di jaringan lokal

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

   <script>
        // Configuration
        const cameraConfigs = {
            'camera1': {
                url: 'http://ipaddressServer/playlist.m3u8',
                name: 'CCTV SIMPANG RT 11',
                resolution: '1280x720',
                fps: 25
            },
            'camera2': {
                url: 'http://ipaddressServer/playlist.m3u8',
                name: 'CCTV RUMAH CAMER',
                resolution: '1280x720',
                fps: 25,
            },
            'camera3': {
                url: '',
                name: 'CCTV KAMAR',
                resolution: '720p',
                fps: 25,
                offline: true
            },
            'camera4': {
                url: '',
                name: 'CCTV GARASI',
                resolution: '720p',
                fps: 25,
                offline: true
            },
            'camera5': {
                url: '',
                name: 'CCTV TERAS',
                resolution: '720p',
                fps: 25,
                offline: true
            },
            'camera6': {
                url: '',
                name: 'CCTV DAPUR',
                resolution: '720p',
                fps: 25,
                offline: true
            }
        };
  
