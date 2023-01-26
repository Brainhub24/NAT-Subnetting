
#                                         Drei Schritte sind für ein NAT-Subnetz notwendig:
#
#1. Erzeugen eines internen Switch im Hyper-V.
#2. Festlegen einer IP-Adresse für den internen Switch. Diese IP-Adresse stellt dann das Standard-Gateway für das NAT-Subnetz dar.
#3. Erzeugen eines NetNat Objekts, mit dem das NAT-Subnetz definiert wird und das später die Netzwerk-Adressübersetzung vornimmt.




#Internen Switch erstellen

New-VMSwitch -SwitchName NATSwitch12 -SwitchType Internal


#Name oder Index der Netzwerkschnittstellen herausbekommen.


Get-NetAdapter

#Und dann Config des neuen Internen Switches

New-NetIPAddress 192.168.12.1 -PrefixLength 24 -InterfaceIndex 12




#Erzeugen eines NetNat Objekts

New-NetNat –Name “NatSwitch12” -InternalIPInterfaceAddressPrefix "192.168.12.0/24"


#Kontrolle ob NAT-Switch OK

Get-NetNat
















