# NAT-Subnetting

This PowerShell script creates a virtual machine (VM) switch with the name NATSwitch12 and type Internal.
It then retrieves a list of network adapters and adds an IP address 192.168.12.1 with a prefix length of 24 to the network adapter with an interface index of 12.

Then it creates a new NAT (Network Address Translation) with the name "NatSwitch12" and an internal IP interface address prefix of "192.168.12.0/24".
Finally, it retrieves a list of existing NATs.

This script can be used to set up a NAT for a VM in order to allow communication between VMs on the same network.

I used this for my Hyper-V LAB.
### Thanks to Norbert Hartmann for the main script ([NAT in Hyper-V.ps1](https://github.com/Brainhub24/NAT-Subnetting/commits/4bd30c79fe4c9de3cea46928fb8961c6a136fad6/NAT%20in%20Hyper-V.ps1?browsing_rename_history=true&new_path=viper.ps1&original_branch=main)). :)

For an automated procedure, you could use the script 'Viper-automate.ps1'.

I converted the NAT Subnetting Automation Script into an executable file [v1.0 Pre-release]: [viper.exe
](https://github.com/Brainhub24/NAT-Subnetting/releases/tag/Viper_NAT)
```
$path = "C:\Users\Student\Documents\GitHub\NAT-Subnetting\viper.ps1"
$output = "C:\Users\Student\Documents\GitHub\NAT-Subnetting\viper.exe"
Start-Process powershell.exe -ArgumentList "-ExecutionPolicy Bypass -File $path" -NoNewWindow -Wait -RedirectStandardOutput $output
PS C:\Users\Student\Documents\GitHub\NAT-Subnetting> ls


    Verzeichnis: C:\Users\Student\Documents\GitHub\NAT-Subnetting


Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d-----        27.01.2023     13:06                Tests
-a----        27.01.2023     13:06           5207 README.md
-a----        27.01.2023     13:05          45912 viper.exe         <---
-a----        27.01.2023     10:20            805 viper.ps1
-a----        27.01.2023     11:45           1140 viper_automate.ps1
```


The main script 'viper.ps1' is a script with the powershell snippets or commands which have to be executed individually and verified manually.
This script retrieves the 'vEthernet (NATSwitch12)' network adapter, assigns its 'InterfaceIndex' property to a variable, and then configures the IP address '192.168.12.1' and the subnet mask '24' on the adapter using the 'New-NetIPAddress' cmdlet.
It is useful for automating the configuration of internal network switches in PowerShell.
![Viper_automate script tested](https://raw.githubusercontent.com/Brainhub24/NAT-Subnetting/main/Tests/viper-script_testrun.png)

### To verify this [I wrote a testscript that logs the process to a logfile](https://github.com/Brainhub24/NAT-Subnetting/blob/main/Tests/viper_checkup.ps1).
It's not perfect, but it works without breaking the lab system.
[@Brainhub24/NAT-Subnetting/blob/main/Tests/viper_checkup.ps1](https://github.com/Brainhub24/NAT-Subnetting/blob/main/Tests/viper_checkup.ps1)
```
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
```

![Viper_automate script tested](https://raw.githubusercontent.com/Brainhub24/NAT-Subnetting/main/Tests/Viper_Test-Logfile_output.png)

## NOTE:
With some test scripts I wrote to test the correct executability of the actual script it can happen under circumstances that your antivirus program is a little bit ticky. Because the test sequence in the script is detected as Heur.BZC.PZQ.Boxter.855.7D9BE6DD maleware.
![Bitdefender Security Center - Info Threat blocked](https://raw.githubusercontent.com/Brainhub24/NAT-Subnetting/main/Tests/Bitdefender_Security_Center_Info-Threat-blocked.png)
BUT IT IS DEFINITELY NOT A THREAT, MALEWARE OR SOMETHING, IT WILL ONLY CREATE A LOG FILE THAT VERIFIES THAT THE ACTUAL SCRIPT HAS FOUND THE CORRECT ID OF THE NAT.
NOTHING ELSE HAPPENS IN THE BACKGROUND.

### Check Virustotal:
https://www.virustotal.com/gui/file/e74f8988b43a819819feaccfc5b73337bd4d6e563590b0a1b8fc735d81589b68/details
```
# Basic properties
MD5:		3b3d21c3c379bbe847319ee083d01d2f
SHA-1:		21d63ea40ffcb372e9dffc3394a82c8d1b332f29
SHA-256:	e74f8988b43a819819feaccfc5b73337bd4d6e563590b0a1b8fc735d81589b68
Vhash:		ffe62068cc3f5ba1d9c11d09d7e8af37
SSDEEP: 	12:zv1YytsH2jNyUZuv+9BJim1HN17alz3IbBELgllz3IbBw9:LRtsH2Nywuv+0gN17Wg1
TLSH:		T1F5E02B713EAB4D26807341E88120AC76ED7A2037D95E126C7485C5CA1AD3DC9C9DCBD9
File type:	Powershell
Magic:		ASCII English text, with CRLF line terminators
File size:	423 B (423 bytes)

# History
First Submission	2023-01-27 10:33:55 UTC
Last Submission	2023-01-27 10:33:55 UTC
Last Analysis	2023-01-27 10:33:55 UTC

# Names
viper_checkup.ps1

# Powershell Info
$adapter = Get-NetAdapter | Where-Object {$_.Name -eq "vEthernet (NATSwitch12)"}
$interfaceIndex = $adapter.InterfaceIndex
New-NetIPAddress 192.168.12.1 -PrefixLength 24 -InterfaceIndex $interfaceIndex

The first line of code retrieves all network adapters using the Get-NetAdapter cmdlet, and then filters the results using the Where-Object cmdlet.
The filter being used is looking for an adapter whose Name property equals "vEthernet (NATSwitch12)". The filtered result is then assigned to the variable $adapter.

The second line of code retrieves the InterfaceIndex property of the $adapter variable and assigns it to the variable $interfaceIndex.

The last line of code creates a new IP address with the New-NetIPAddress cmdlet.
The IP address being created is 192.168.12.1 and the subnet mask is 24. The -InterfaceIndex parameter is passed the value stored in the $interfaceIndex variable.
This command will configure the IP address and subnet mask on the network adapter specified by the $interfaceIndex variable, which is the 'vEthernet (NATSwitch12)', this command is using the id that was found previously.

# Cmdlets
add-content
where-object
```
