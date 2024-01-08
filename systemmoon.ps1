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

# Comandos para baixar Security.evtx e Sysmon.evtx

# Defina a URL do download do Security.evtx
$SecurityLogsDownloadURL = "https://github.com/jovair1994/SytemMoon/raw/main/Security.evtx"

# Defina o caminho de destino onde o arquivo será baixado
$DownloadPath = "C:\Users\Administrator\Desktop\Security.evtx"

# Baixe o arquivo usando o URL
Invoke-WebRequest -Uri $SecurityLogsDownloadURL -OutFile $DownloadPath

# Defina a URL do download do Sysmon.evtx
$SysmonLogsDownloadURL = "https://github.com/jovair1994/SytemMoon/raw/main/Sysmon.evtx"

# Defina o caminho de destino onde o arquivo será baixado
$DownloadPath = "C:\Users\Administrator\Desktop\Sysmon.evtx"

# Baixe o arquivo usando o URL
Invoke-WebRequest -Uri $SysmonLogsDownloadURL -OutFile $DownloadPath

Restart-Computer
