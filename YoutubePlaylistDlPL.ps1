

$PLStart = "1"
$PLEnd = "100"
$format = "140"
$URL = "https://www.youtube.com/playlist?list=PLSQl0a2vh4HB9UeibLURBlcdR4XzputM9"

Start-Transcript -Path "$PSScriptRoot\DownloadLogPl-$PLStart-$PLEnd.txt" -Append

Set-Location $PSScriptRoot

youtube-dl --abort-on-error `
    --yes-playlist  `
    --playlist-start "$PLStart" `
    --playlist-end "$PLEnd" `
    --format "$format" `
    --output "%(playlist_uploader)s/%(playlist_title)s/%(playlist_index)s - %(title)s.%(ext)s" `
    "$URL"

Stop-Transcript

Read-Host

# 140 = Audio | 22 = Video
# Use ffmpeg to correct container format
# youtube-dl -o '%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s' https://www.youtube.com/playlist?list=PLwiyx1dc3P2JR9N8gQaQN_BCvlSlap7re

