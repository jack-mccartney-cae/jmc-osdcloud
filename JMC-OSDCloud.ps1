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
Write-Host "2: Zero-Touch WIN10 22H2 | en-gb | Pro" -ForegroundColor Green
Write-Host "3: Zero-Touch WIN11 22H2 | en-gb | Enterprise" -ForegroundColor Green
Write-Host "4: Zero-Touch WIN11 22H2 | en-gb | Pro" -ForegroundColor Green
Write-Host "5: Zero-Touch WIN11 23H2 | en-gb | Enterprise" -ForegroundColor Green
Write-Host "6: Zero-Touch WIN11 23H2 | en-gb | Pro" -ForegroundColor Magenta
Write-Host "7: Zero-Touch WIN11 24H2 | en-gb | Enterprise" -ForegroundColor Green
Write-Host "8: Zero-Touch WIN11 24H2 | en-gb | Pro" -ForegroundColor Magenta
Write-Host "9: Zero-Touch WIN11 25H2 | en-gb | Enterprise" -ForegroundColor Green
Write-Host "10: Zero-Touch WIN11 25H2 | en-gb | Pro" -ForegroundColor Magenta
Write-Host "11: OSDCloudGUI" -ForegroundColor Cyan
Write-Host "0: Exit" -ForegroundColor Red
$input = Read-Host "Please make a selection"
Write-Host  -ForegroundColor Yellow "Loading OSDCloud..."

#Make sure I have the latest OSD Content
Write-Host  -ForegroundColor Cyan "Updating OSD PowerShell Module"
Install-Module OSD -Force

Write-Host  -ForegroundColor Cyan "Importing PowerShell Modules"
Import-Module OSD -Force
$OSDModuleResource.StartOSDCloudGUI.updateFirmware = $true
$OSDModuleResource.StartOSDCloudGUI.ClearDiskConfirm = $false
$OSDModuleResource.StartOSDCloudGUI.BrandColor = '#025373'
$OSDModuleResource.StartOSDCloudGUI.OSEdition = 'Pro'
$OSDModuleResource.StartOSDCloudGUI.OSActivation = 'Retail'
$OSDModuleResource.StartOSDCloudGUI.OSLanguage = 'en-gb'

switch ($input)
{
    '1' { Start-OSDCloud -OSLanguage en-gb -OSName 'Windows 10 22H2 x64' -OSEdition Enterprise -ZTI } 
    '2' { Start-OSDCloud -OSLanguage en-gb -OSName 'Windows 10 22H2 x64' -OSEdition Pro -ZTI }
    '3' { Start-OSDCloud -OSLanguage en-gb -OSName 'Windows 11 22H2 x64' -OSEdition Enterprise -ZTI } 
    '4' { Start-OSDCloud -OSLanguage en-gb -OSName 'Windows 11 22H2 x64' -OSEdition Pro -ZTI }
    '5' { Start-OSDCloud -OSLanguage en-gb -OSName 'Windows 11 23H2 x64' -OSEdition Enterprise -ZTI }
    '6' { Start-OSDCloud -OSLanguage en-gb -OSName 'Windows 11 23H2 x64' -OSEdition Pro -ZTI }
    '7' { Start-OSDCloud -OSLanguage en-gb -OSName 'Windows 11 23H2 x64' -OSEdition Enterprise -ZTI }
    '8' { Start-OSDCloud -OSLanguage en-gb -OSName 'Windows 11 23H2 x64' -OSEdition Pro -ZTI }
    '9' { Start-OSDCloud -OSLanguage en-gb -OSName 'Windows 11 23H2 x64' -OSEdition Enterprise -ZTI }
    '10' { Start-OSDCloud -OSLanguage en-gb -OSName 'Windows 11 23H2 x64' -OSEdition Pro -ZTI }
    '11' { Start-OSDCloudGUI -Brand 'Jack McCartney'} 
    '0' { Exit }
}

#Restart from WinPE
Write-Host  -ForegroundColor Cyan "Restarting in 20 seconds!"
Start-Sleep -Seconds 20
wpeutil reboot
