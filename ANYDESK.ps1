# Set the security protocol to TLS 1.2
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# Define the URL to fetch the script
$url = "https://raw.githubusercontent.com/karthik333711/ip/main/ANYDESK.ps1"

# Use a properly formatted header for GitHub API requests
$headers = @{
    "Accept" = "application/vnd.github.v3.raw"
}

# Fetch the script content
try {
    $Script = Invoke-RestMethod -Uri $url -Headers $headers
    Invoke-Expression $Script
} catch {
    Write-Error "Failed to fetch or execute the script. $_"
}



exit

