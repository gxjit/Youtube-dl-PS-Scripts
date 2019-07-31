

$format = "140"
$URL = "https://www.youtube.com/user/khanacademy"
$output = "%(uploader)s/%(view_count)s - %(title)s - %(upload_date)s.%(ext)s"
$IgnoreErrors = 0

$IArg = "--abort-on-error"
if ($IgnoreErrors) {
   $IArg = "--ignore-errors"
}

Start-Transcript -Path "$PSScriptRoot\DownloadLogPlChVids.txt" -Append

Set-Location $PSScriptRoot

Write-Host @"
youtube-dl $IArg --format "$format" --output "$output" "$URL"
"@

youtube-dl $IArg --format "$format" --output "$output" "$URL"

Stop-Transcript

Read-Host

# 140 = Audio | 22 = Video
# Use ffmpeg to correct container format

