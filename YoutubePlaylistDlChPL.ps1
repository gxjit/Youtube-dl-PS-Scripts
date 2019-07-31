

$format = "140"
$URL = "https://www.youtube.com/user/khanacademy/playlists"
$output = "%(playlist_uploader)s/%(playlist_title)s/%(playlist_index)s - %(title)s.%(ext)s"
$IgnoreErrors = 0

$IArg = "--abort-on-error"
if ($IgnoreErrors) {
   $IArg = "--ignore-errors"
}

Start-Transcript -Path "$PSScriptRoot\DownloadLogChPl.txt" -Append

Set-Location $PSScriptRoot

Write-Host @"
youtube-dl $IArg --yes-playlist --format "$format" --output "$output" "$URL"
"@

youtube-dl $IArg --yes-playlist --format "$format" --output "$output" "$URL"

Stop-Transcript

Read-Host

# 140 = Audio | 22 = Video
# Use ffmpeg to correct container format
# youtube-dl -o '%(uploader)s/%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s' https://www.youtube.com/user/TheLinuxFoundation/playlists
