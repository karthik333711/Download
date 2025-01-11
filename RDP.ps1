# Set the security protocol to TLS 1.2
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# Define the GitHub repository information
$repoOwner = "karthik333711"
$repoName = "RDP"
$branch = "main"

# Construct the URL to download the ZIP archive of the repository
$zipUrl = "https://github.com/$repoOwner/$repoName/archive/refs/heads/$branch.zip"

# Path to save the ZIP file and extract the repository
$tempPath = "$env:TEMP\RepoDownload"
$zipFilePath = "$tempPath\$repoName.zip"
$extractPath = "$tempPath\$repoName-$branch"

# Ensure the temporary directory exists
if (!(Test-Path -Path $tempPath)) {
    New-Item -ItemType Directory -Path $tempPath | Out-Null
}

# Download the ZIP file
try {
    Write-Host "Downloading repository ZIP..."
    Invoke-WebRequest -Uri $zipUrl -OutFile $zipFilePath
    Write-Host "Repository downloaded to $zipFilePath"
} catch {
    Write-Error "Failed to download the repository ZIP. $_"
    exit 1
}

# Extract the ZIP file
try {
    Write-Host "Extracting repository ZIP..."
    Expand-Archive -Path $zipFilePath -DestinationPath $tempPath -Force
    Write-Host "Repository extracted to $extractPath"
} catch {
    Write-Error "Failed to extract the ZIP file. $_"
    exit 1
}

# Define the path to the install.bat file
$batchFilePath = Join-Path -Path $extractPath -ChildPath "install.bat"

# Check if the batch file exists
if (Test-Path -Path $batchFilePath) {
    # Execute the batch file
    try {
        Write-Host "Executing install.bat..."
        Start-Process -FilePath "cmd.exe" -ArgumentList "/c `"$batchFilePath`"" -Wait
        Write-Host "install.bat executed successfully."
    } catch {
        Write-Error "Failed to execute install.bat. $_"
    }
} else {
    Write-Error "install.bat not found in the repository."
}

# Clean up temporary files (optional)
try {
    Remove-Item -Path $tempPath -Recurse -Force
    Write-Host "Temporary files cleaned up."
} catch {
    Write-Warning "Failed to clean up temporary files. $_"
}


exit

