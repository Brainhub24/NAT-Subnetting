
# Three steps are necessary for a NAT subnet:
#
# 1. Create an internal switch in Hyper-V.
# 2. Set an IP address for the internal switch. This IP address then represents the default gateway for the NAT subnet.
# 3. Create a NetNat object that will be used to define the NAT subnet and that will later perform the network address translation.




# Create an internal switch

New-VMSwitch -SwitchName NATSwitch12 -SwitchType Internal


# Get the name or index of the network interfaces.


Get-NetAdapter

# And then Config the new Internal Switch

New-NetIPAddress 192.168.12.1 -PrefixLength 24 -InterfaceIndex 12




# Create a NetNat object

New-NetNat -Name "NatSwitch12" -InternalIPInterfaceAddressPrefix "192.168.12.0/24"


# Check if NAT switch is OK

Get-NetNat
