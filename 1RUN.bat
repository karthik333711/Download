@echo off
powershell -Command "Set-ExecutionPolicy RemoteSigned -Scope Process; Set-ExecutionPolicy RemoteSigned -Scope CurrentUser"

powershell -Command "Start-Process powershell -Verb RunAs -ArgumentList '-Command Start-Sleep -Seconds 1; Exit'"


@echo off
cd /d "%~dp0"
powershell -Command "Start-Process PowerShell -ArgumentList '-File ""%~dp0RDP.ps1""' -WindowStyle Minimized -Verb RunAs"

@echo off
cd /d "%~dp0"
powershell -Command "Start-Process PowerShell -ArgumentList '-File ""%~dp0USER.ps1""' -WindowStyle Minimized -Verb RunAs"


@echo off
cd /d "%~dp0"
powershell -Command "Start-Process PowerShell -ArgumentList '-File ""%~dp0VNC.ps1""' -WindowStyle Minimized -Verb RunAs"


@echo off
cd /d "%~dp0"
powershell -Command "Start-Process PowerShell -ArgumentList '-File ""%~dp0IP.ps1""' -WindowStyle Minimized -Verb RunAs"



timeout /t 1 && exit
