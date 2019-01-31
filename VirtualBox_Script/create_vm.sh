#! /bin/bash
Green='\033[0;32m' ; UCyan='\033[4;36m' ; NC='\033[0m' ; DONE='DONE' ;

echo "Name for the VM : [name]"
read Name
echo "Choose a file-system : [OS_VERSION] Type -h for see the list of OS_NAME"
read File_System
if [ $File_System = "-h" ] 
then
    cat .list_os
    echo "\nChoose a file-system : [OS_VERSION];"
    read File_System
fi
VBoxManage createvm --name "$Name" --ostype $File_System --register
echo "[ $UCyan$DONE$NC ]";

echo "Do u want to configure $Name VM ? [Y or N]"
read Valid
if [ $Valid = "N" ]
then
    exit 1;
fi

echo "Choose the size of ram of $Name : [2048]"
read Size_Ram
echo "$Size_Ram mb is ok ? : [Y or N]"
read Valid
if [ $Valid = "N" ]
then
    echo "Choose the size of ram of $Name : [2048]"
    read Size_Ram
fi
VBoxManage modifyvm "$Name" --memory $Size_Ram
echo "$GREEN$Name have $Size_Ram mb"

echo "Choose the number of core of $Name : [1]"
read Nb_Core
echo "$Nb_Core core is ok ? : [Y or N]"
read Valid
if [ $Valid = "N" ]
then
    echo "Choose the number of core of $Name : [1]"
    read Nb_Core
fi
VBoxManage modifyvm "$Name"  --cpus $Nb_Core
echo "$GREEN$Name have $Nb_Core core"

echo "Choose the memory video in MO of $Name : [0 to 128]"
read Size_Video_Mem
echo "$Size_Video_Mem mo is ok ? : [Y or N]"
read Valid
if [ $Valid = "N" ]
then
    echo "Choose the memory video in MO of $Name : [0 to 128]"
    read Size_Video_Mem
fi
VBoxManage modifyvm "$Name" --vram $Size_Video_Mem
echo "$GREEN$Name have $Size_Video_Mem MO"

echo "Choose the network card of $Name : [NAT]"
read Network_card
echo "$Network_card is ok ? : [Y or N]"
read Valid
if [ $Valid = "N" ]
then
    echo "Choose the network card of $Name : [bridged]"
    read Network_card
fi
VBoxManage modifyvm "$Name" --nic1 $Network_card
echo "$GREEN$Name have $Network_card for network"

VBoxManage modifyvm $Name --usb on
echo "The usb ports of $Name are activate"

echo "Do you want to create a Hard Disk : [Y or N]"
read Valid
if [ $Valid = "N" ]
then
    echo "Do u want to exit or set a hard disk ? [1 or 2]"
    read Valid
    if [ $Valid = "1" ]
    then
        exit 1;
    fi
fi

echo "Choose the size of Hard Disk in MO [5000]"
read Size_Disk
echo "$Size_Disk MO of hard disk for $Name is ok ? [Y or N]"
read Valid
if [ $Valid = "N" ]
then
    echo "Choose the size of Hard Disk in MO [5000]"
r   ead Size_Disk
fi
echo "Choose the name of the disk to the $Debian VM : [$Name]"
read Name_Disk
VBoxManage createhd --filename "$Name" --size $Size_Disk
VBoxManage storagectl "$Name" --name "SATA" --add sata
VBoxManage storageattach "$Name" --storagectl "SATA" --port 0 --device 0 --type hdd --medium "$Name_Disk.vdi"
VBoxManage storageattach "$Name" --storagectl "SATA" --port 1 --device 0 --type dvddrive --medium emptydrive
echo "[ $UCyan$DONE$NC ]";
echo "Do u want to add an iso for $Name VM ?: [Yn]"
read Valid
if [ $Valid = "n" ]
then
    exit 1;
fi
echo "Tips the path of the file.iso ?: [path/[...].iso]"
read Path_iso
VBoxManage storageattach $Name --storagectl SATA --port 1 --device 0 --type dvddrive --medium $Path_iso
echo "[ $UCyan$DONE$NC ]";
echo "Launch the $Name VM ?: [Yn]"
read Valid
if [ $Valid = "n" ]
then
    exit 1;
fi
VBoxManage startvm $Name
exit 1;