

$format = "140"
$URL = "https://www.youtube.com/user/khanacademy/playlists"

Start-Transcript -Path "$PSScriptRoot\DownloadLogChPl.txt" -Append

Set-Location $PSScriptRoot

youtube-dl --abort-on-error `
    --yes-playlist  `
    --format "$format" `
    --output "%(playlist_uploader)s/%(playlist_title)s/%(playlist_index)s - %(title)s.%(ext)s" `
    "$URL"

Stop-Transcript

Read-Host

# 140 = Audio | 22 = Video
# Use ffmpeg to correct container format
# youtube-dl -o '%(uploader)s/%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s' https://www.youtube.com/user/TheLinuxFoundation/playlists
