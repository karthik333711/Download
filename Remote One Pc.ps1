$ComputerName = "SCAS"
$Username = "Karthik"
$Password = "123"

# Store credentials temporarily
cmdkey /add:$ComputerName /user:$Username /pass:$Password

# Launch RDP
Start-Process "mstsc.exe" -ArgumentList "/v:$ComputerName"


