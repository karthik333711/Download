$ComputerName = "SCAS"
$Username = "Karthik"
$Password = "123"

# Store credentials temporarily
cmdkey /add:$ComputerName /user:$Username /pass:$Password

# Launch RDP
Start-Process "mstsc.exe" -ArgumentList "/v:$ComputerName"

# Optional: Remove stored credentials after use
Start-Sleep -Seconds 5
cmdkey /delete:$ComputerName
