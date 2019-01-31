#! /bin/bash
to_exit='N' ;

VBoxManage list vms
echo "Which Vm u want to see info ?"
read Name
while [ $to_exit == 'N' ]
    do
    VBoxManage showvminfo "$Name"
    echo "Choose just only 1 info to grep : [Storage/UUID/Boot/Tracing/NIC 1]"
    read Info_to_print
    VBoxManage showvminfo "$Name" | grep $Info_to_print
    echo "U want to exit or change the grep ? : [Y or n]"
    read to_exit;
done
exit 1;