Write-Host  -ForegroundColor Cyan "Starting OSDCloud ..."
Start-Sleep -Seconds 5

#Change Display Resolution for Virtual Machine
if ((Get-MyComputerModel) -match 'Virtual') {
    Write-Host  -ForegroundColor Cyan "Setting Display Resolution to 1366x"
    Set-DisRes 1366
}
cls
Write-Host "===================== Main Menu ======================="
Write-Host "1: Zero-Touch WIN10 22H2 | en-gb | Enterprise" -ForegroundColor Green
Write-Host "2: Zero-Touch WIN10 22H2 | en-gb | Professional" -ForegroundColor Green
Write-Host "3: Zero-Touch WIN11 22H2 | en-gb | Enterprise" -ForegroundColor Green
Write-Host "4: Zero-Touch WIN11 22H2 | en-gb | Professional" -ForegroundColor Green
Write-Host "5: Zero-Touch WIN11 23H2 | en-gb | Enterprise" -ForegroundColor Green
Write-Host "6: Zero-Touch WIN11 23H2 | en-gb | Professional" -ForegroundColor Magenta
Write-Host "8: OSDCloudGUI" -ForegroundColor Cyan
Write-Host "0: Exit" -ForegroundColor Red
$input = Read-Host "Please make a selection"
Write-Host  -ForegroundColor Yellow "Loading OSDCloud..."

#Make sure I have the latest OSD Content
Write-Host  -ForegroundColor Cyan "Updating OSD PowerShell Module"
Install-Module OSD -Force

Write-Host  -ForegroundColor Cyan "Importing PowerShell Modules"
Import-Module OSD -Force

switch ($input)
{
    '1' { Start-OSDCloud -OSLanguage en-gb -OSName 'Windows 10 22H2 x64' -OSEdition Enterprise -ZTI } 
    '2' { Start-OSDCloud -OSLanguage en-gb -OSName 'Windows 10 22H2 x64' -OSEdition Professional -ZTI }
    '3' { Start-OSDCloud -OSLanguage en-gb -OSName 'Windows 11 22H2 x64' -OSEdition Enterprise -ZTI } 
    '4' { Start-OSDCloud -OSLanguage en-gb -OSName 'Windows 11 22H2 x64' -OSEdition Professional -ZTI }
    '5' { Start-OSDCloud -OSLanguage en-gb -OSName 'Windows 11 23H2 x64' -OSEdition Enterprise -ZTI }
    '6' { Start-OSDCloud -OSLanguage en-gb -OSName 'Windows 11 23H2 x64' -OSEdition Professional -ZTI }  
    '8' { Start-OSDCloudGUI	-Brand 'CAE'} 
    '0' { Exit }
}

#Restart from WinPE
Write-Host  -ForegroundColor Cyan "Restarting in 20 seconds!"
Start-Sleep -Seconds 20
wpeutil reboot
