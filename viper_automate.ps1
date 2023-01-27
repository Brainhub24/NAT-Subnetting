# The main script 'viper.ps1' is a script with the powershell snippets or commands which have to be executed individually and verified manually.
# If you want to automate the whole process of the main script, you can test and use this script.
# This script retrieves the 'vEthernet (NATSwitch12)' network adapter, assigns its 'InterfaceIndex' property to a variable, and then configures the IP address '192.168.12.1' and the subnet mask '24' on the adapter using the 'New-NetIPAddress' cmdlet.
# It is useful for automating the configuration of internal network switches in PowerShell.



# Create an internal switch
New-VMSwitch -SwitchName NATSwitch12 -SwitchType Internal

# Get the interface index of the vEthernet (NATSwitch12)
$adapter = Get-NetAdapter | Where-Object {$_.Name -eq "vEthernet (NATSwitch12)"}
$interfaceIndex = $adapter.InterfaceIndex

# Config the new Internal Switch
New-NetIPAddress 192.168.12.1 -PrefixLength 24 -InterfaceIndex $interfaceIndex

# Create a NetNat object
New-NetNat -Name "NatSwitch12" -InternalIPInterfaceAddressPrefix "192.168.12.0/24"

# Check if NAT switch is OK
Get-NetNat
