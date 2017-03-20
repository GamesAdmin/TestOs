#! /bin/sh

#Удаление VM и диска (VDI)

VB_VM_NAME="TestOs_test"

VBoxManage unregistervm --delete $VB_VM_NAME
