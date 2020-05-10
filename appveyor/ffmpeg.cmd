mkdir data

rem cut files
ffmpeg-20200504-5767a2e-win64-shared\bin\ffmpeg -i da_nil_-_spaceman.mp3 -ss 0  -t 30 -ar 44100 -nostats -loglevel 0 -y data/da_ni_spaceman-0.wav
ffmpeg-20200504-5767a2e-win64-shared\bin\ffmpeg -i da_nil_-_spaceman.mp3 -ss 30 -t 30 -ar 44100 -nostats -loglevel 0 -y data/da_ni_spaceman-1.wav
ffmpeg-20200504-5767a2e-win64-shared\bin\ffmpeg -i da_nil_-_night.mp3    -ss 0  -t 30 -ar 44100 -nostats -loglevel 0 -y data/da_ni_night-0.wav
ffmpeg-20200504-5767a2e-win64-shared\bin\ffmpeg -i da_nil_-_night.mp3    -ss 30 -t 30 -ar 44100 -nostats -loglevel 0 -y data/da_ni_night-1.wav

rem 44100 => 48000
ffmpeg-20200504-5767a2e-win64-shared\bin\ffmpeg -i data/da_ni_spaceman-0.wav -ar 48000 -nostats -loglevel 0 -y data/da_ni_spaceman-0-48000.wav
ffmpeg-20200504-5767a2e-win64-shared\bin\ffmpeg -i data/da_ni_spaceman-1.wav -ar 48000 -nostats -loglevel 0 -y data/da_ni_spaceman-1-48000.wav
ffmpeg-20200504-5767a2e-win64-shared\bin\ffmpeg -i data/da_ni_night-0.wav -ar 48000 -nostats -loglevel 0 -y data/da_ni_night-0-48000.wav
ffmpeg-20200504-5767a2e-win64-shared\bin\ffmpeg -i data/da_ni_night-1.wav -ar 48000 -nostats -loglevel 0 -y data/da_ni_night-1-48000.wav

rem change volume
ffmpeg-20200504-5767a2e-win64-shared\bin\ffmpeg -i data/da_ni_spaceman-0.wav -filter:a "volume=3dB" -nostats -loglevel 0 -y data/da_ni_spaceman-0-plus-3.wav
ffmpeg-20200504-5767a2e-win64-shared\bin\ffmpeg -i data/da_ni_spaceman-0.wav -filter:a "volume=6dB" -nostats -loglevel 0 -y data/da_ni_spaceman-0-plus-6.wav
ffmpeg-20200504-5767a2e-win64-shared\bin\ffmpeg -i data/da_ni_spaceman-0.wav -filter:a "volume=15dB" -nostats -loglevel 0 -y data/da_ni_spaceman-0-plus-15.wav
ffmpeg-20200504-5767a2e-win64-shared\bin\ffmpeg -i data/da_ni_spaceman-0.wav -filter:a "volume=20dB" -nostats -loglevel 0 -y data/da_ni_spaceman-0-plus-20.wav
ffmpeg-20200504-5767a2e-win64-shared\bin\ffmpeg -i data/da_ni_spaceman-0.wav -filter:a "volume=-3dB" -nostats -loglevel 0 -y data/da_ni_spaceman-0-minus-3.wav
ffmpeg-20200504-5767a2e-win64-shared\bin\ffmpeg -i data/da_ni_spaceman-0.wav -filter:a "volume=-6dB" -nostats -loglevel 0 -y data/da_ni_spaceman-0-minus-6.wav
ffmpeg-20200504-5767a2e-win64-shared\bin\ffmpeg -i data/da_ni_spaceman-0.wav -filter:a "volume=-13dB" -nostats -loglevel 0 -y data/da_ni_spaceman-0-minus-13.wav

ffmpeg-20200504-5767a2e-win64-shared\bin\ffmpeg -i data/da_ni_night-1-48000.wav -filter:a "volume=3dB" -nostats -loglevel 0 -y data/da_ni_night-1-48000-plus-3.wav
ffmpeg-20200504-5767a2e-win64-shared\bin\ffmpeg -i data/da_ni_night-1-48000.wav -filter:a "volume=6dB" -nostats -loglevel 0 -y data/da_ni_night-1-48000-plus-6.wav
ffmpeg-20200504-5767a2e-win64-shared\bin\ffmpeg -i data/da_ni_night-1-48000.wav -filter:a "volume=15dB" -nostats -loglevel 0 -y data/da_ni_night-1-48000-plus-15.wav
ffmpeg-20200504-5767a2e-win64-shared\bin\ffmpeg -i data/da_ni_night-1-48000.wav -filter:a "volume=20dB" -nostats -loglevel 0 -y data/da_ni_night-1-48000-plus-20.wav
ffmpeg-20200504-5767a2e-win64-shared\bin\ffmpeg -i data/da_ni_night-1-48000.wav -filter:a "volume=-3dB" -nostats -loglevel 0 -y data/da_ni_night-1-48000-minus-3.wav
ffmpeg-20200504-5767a2e-win64-shared\bin\ffmpeg -i data/da_ni_night-1-48000.wav -filter:a "volume=-6dB" -nostats -loglevel 0 -y data/da_ni_night-1-48000-minus-6.wav
ffmpeg-20200504-5767a2e-win64-shared\bin\ffmpeg -i data/da_ni_night-1-48000.wav -filter:a "volume=-13dB" -nostats -loglevel 0 -y data/da_ni_night-1-48000-minus-13.wav

rem Merge
ffmpeg-20200504-5767a2e-win64-shared\bin\ffmpeg -i data/da_ni_spaceman-0.wav -i data/da_ni_night-0.wav -filter_complex amix -c:a pcm_s16le -ar 44100 -ac 2 -nostats -loglevel 0 -y data/da_ni_spaceman-0__da_ni_night-0.wav
ffmpeg-20200504-5767a2e-win64-shared\bin\ffmpeg -i data/da_ni_spaceman-0.wav -i data/da_ni_night-1-48000.wav -filter_complex amix -c:a pcm_s16le -ar 44100 -ac 2 -nostats -loglevel 0 -y data/da_ni_spaceman-0__da_ni_night-1.wav
ffmpeg-20200504-5767a2e-win64-shared\bin\ffmpeg -i data/da_ni_spaceman-1.wav -i data/da_ni_night-0.wav -filter_complex amix -c:a pcm_s16le -ar 44100 -ac 2 -nostats -loglevel 0 -y data/da_ni_spaceman-1__da_ni_night-0.wav
ffmpeg-20200504-5767a2e-win64-shared\bin\ffmpeg -i data/da_ni_spaceman-1.wav -i data/da_ni_night-1-48000.wav -filter_complex amix -c:a pcm_s16le -ar 44100 -ac 2 -nostats -loglevel 0 -y data/da_ni_spaceman-1__da_ni_night-1.wav
ffmpeg-20200504-5767a2e-win64-shared\bin\ffmpeg -i data/da_ni_spaceman-1-48000.wav -i data/da_ni_night-1-48000.wav -filter_complex amix -c:a pcm_s16le -ar 48000 -ac 2 -nostats -loglevel 0 -y data/da_ni_spaceman-1__da_ni_night-1.1.wav

dir data\*
