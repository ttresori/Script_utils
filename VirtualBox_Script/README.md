
You can use this script to Create and Set(if u want) a new VM on VirtualBox; \n
    [*] Work on 6.0 on mac;
--------------------------------------

Just add an iso file on the sata port : \n
    VBoxManage list vms \n
        to get the uuid and name; \n
    VBoxManage showvminfo "$Name" | grep Storage \n
        to get info of the disk of $Name Vm;

    VBoxManage storageattach "uuid or vmname" --storagectl IDE or SATA --port "number_if_port" --device "number_device" --type dvddrive --medium "path\the.iso"

--------------------------------------

Remove an iso;

    VBoxManage.exe storageattach "uuid or vmname" --storagectl IDE or SATA --port "number_if_port" --device "number_device" --medium "none"

--------------------------------------

https://www.virtualbox.org/manual/ch08.html