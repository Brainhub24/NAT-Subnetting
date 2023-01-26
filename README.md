# NAT-Subnetting

This PowerShell script creates a virtual machine (VM) switch with the name NATSwitch12 and type Internal.
It then retrieves a list of network adapters and adds an IP address 192.168.12.1 with a prefix length of 24 to the network adapter with an interface index of 12.

Then it creates a new NAT (Network Address Translation) with the name "NatSwitch12" and an internal IP interface address prefix of "192.168.12.0/24".
Finally, it retrieves a list of existing NATs.

This script can be used to set up a NAT for a VM in order to allow communication between VMs on the same network.

I used this for my Hyper-V LAB.
