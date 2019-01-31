|------------------------------------+
| 32bits             64bits           |
|             WINDOWS                 |
|             -------                 |
| WindowsXP           WindowsXP_64    |
| Windows2003         Windows2003_64  |
| WindowsVista        WindowsVista_64 |	
| Windows2008         Windows2008_64  |
| Windows7            Windows7_64     |
| WindowsNT                           |
|             LINUX                   |
|             -----                   |
| Linux22             Linux 2.2       |
| Linux24             Linux24_64      | 
| Linux26             Linux26_64      |	
| Debian              Debian_64       |
| OpenSUSE            OpenSUSE_64     |	
| Fedora              Fedora_64       |
| Mandriva            Mandriva_64     |	
| RedHat              RedHat_64       |
| Ubuntu              Ubuntu_64       |
| Oracle              Oracle_64       |
|             DOS                     |
|             ---                     |
| FreeBSD             FreeBSD_64      |
| OpenBSD             OpenBSD_64      |
| MacOS               MacOS_64        |
-------------------------------------+

You can use this script to Create and Set(if u want) a new VM on VirtualBox; 
    [*] Work on 6.0 on mac;
--------------------------------------

Just add an iso file on the sata port;
    VBoxManage list vms
        to get the uuid and name;
    VBoxManage showvminfo "$Name" | grep Storage
        to get info of the disk of $Name Vm;

    VBoxManage storageattach "uuid or vmname" --storagectl IDE or SATA --port "number_if_port" --device "number_device" --type dvddrive --medium "path\the.iso"

--------------------------------------

Remove an iso;

    VBoxManage.exe storageattach "uuid or vmname" --storagectl IDE or SATA --port "number_if_port" --device "number_device" --medium "none"

--------------------------------------

https://www.virtualbox.org/manual/ch08.html