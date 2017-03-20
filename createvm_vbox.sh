#! /bin/sh

#Создание полноценной VM

VB_VM_NAME="TestOs_test"

VBoxManage createhd --filename vbox/$VB_VM_NAME.vdi --size 20480

VBoxManage createvm --register --name $VB_VM_NAME --ostype Other
VBoxManage modifyvm $VB_VM_NAME --memory 512 --floppy disabled --audio none --vram 4 --accelerate3d off --boot1 disk --acpi on --usb off

VBoxManage storagectl $VB_VM_NAME --name "SATA Controller" --add sata --controller IntelAHCI
VBoxManage storageattach $VB_VM_NAME --storagectl "SATA Controller" --port 0 --device 0 --type hdd --medium vbox/$VB_VM_NAME.vdi

VBoxManage storagectl $VB_VM_NAME --name "IDE Controller" --add ide
VBoxManage storageattach $VB_VM_NAME --storagectl "IDE Controller" --port 0 --device 0 --type dvddrive --medium image/testos.iso

VBoxManage modifyvm $VB_VM_NAME --boot1 dvd
