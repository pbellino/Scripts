# Use:
#  create_has.ps1 -FilePath "name_of_the_file"
param (
    [string]$FilePath
)

# Validate input
if (-Not (Test-Path $FilePath)) {
    Write-Error "File not found: $FilePath"
    exit
}

# Get the file name
$FileName = (Get-Item $FilePath).Name

# Compute the hash
$Hash = Get-FileHash $FilePath -Algorithm SHA256

# Output only the file name and checksum
"$($Hash.Hash)  $FileName " | Out-File "checksum.txt"

Write-Output "Checksum saved to checksum.txt"

