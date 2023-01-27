# NAT-Subnetting

This PowerShell script creates a virtual machine (VM) switch with the name NATSwitch12 and type Internal.
It then retrieves a list of network adapters and adds an IP address 192.168.12.1 with a prefix length of 24 to the network adapter with an interface index of 12.

Then it creates a new NAT (Network Address Translation) with the name "NatSwitch12" and an internal IP interface address prefix of "192.168.12.0/24".
Finally, it retrieves a list of existing NATs.

This script can be used to set up a NAT for a VM in order to allow communication between VMs on the same network.

I used this for my Hyper-V LAB.
Thanks to Norbert Hartmann for the main script. :)

For an automated procedure, you could use the script 'Viper-automate.ps1'. 
![Viper_automate script tested](https://raw.githubusercontent.com/Brainhub24/NAT-Subnetting/main/Tests/viper-script_testrun.png)
The main script 'viper.ps1' is a script with the powershell snippets or commands which have to be executed individually and verified manually.
This script retrieves the 'vEthernet (NATSwitch12)' network adapter, assigns its 'InterfaceIndex' property to a variable, and then configures the IP address '192.168.12.1' and the subnet mask '24' on the adapter using the 'New-NetIPAddress' cmdlet.
It is useful for automating the configuration of internal network switches in PowerShell.

![Viper_automate script tested](https://raw.githubusercontent.com/Brainhub24/NAT-Subnetting/main/Tests/Viper_Test-Logfile_output.png)

## NOTE:
With some test scripts I wrote to test the correct executability of the actual script it can happen under circumstances that your antivirus program is a little bit ticky. Because the test sequence in the script is detected as Heur.BZC.PZQ.Boxter.855.7D9BE6DD maleware.
![Bitdefender Security Center - Info Threat blocked](https://raw.githubusercontent.com/Brainhub24/NAT-Subnetting/main/Tests/Bitdefender_Security_Center_Info-Threat-blocked.png)
BUT IT IS DEFINITELY NOT MALEWARE, IT WILL ONLY CREATE A LOG FILE THAT VERIFIES THAT THE ACTUAL SCRIPT HAS FOUND THE CORRECT ID OF THE NAT.
NOTHING ELSE HAPPENS IN THE BACKGROUND.

Check Virustotal: https://www.virustotal.com/gui/file/e74f8988b43a819819feaccfc5b73337bd4d6e563590b0a1b8fc735d81589b68/details
