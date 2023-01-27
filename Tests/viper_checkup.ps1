#Create Log File
$logFile = "$env:temp\logfile.txt"

# Get the interface index of the vEthernet (NATSwitch12)
try {
    $adapter = Get-NetAdapter | Where-Object {$_.Name -eq "vEthernet (NATSwitch12)"}
    $interfaceIndex = $adapter.InterfaceIndex
    $interfaceIndex
    Add-Content -Path $logFile -Value "Get-NetAdapter - Success"
} catch {
    Add-Content -Path $logFile -Value "Get-NetAdapter - Error: $_"
}
