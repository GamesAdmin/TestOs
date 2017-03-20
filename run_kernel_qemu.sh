#! /bin/sh

#Запуск QEMU без настроек (без выделения памяти, без создания дисков, контроллеров)
#Так как нашему ОС (ПНУ) ничего не надо
qemu-system-i386 -kernel bin/kernel.bin

#Используйте следующие команды для создания полноценой эмуляции:
#qemu-img create qemu/TestOs_test.img 2G
#qemu-system-i386 -kernel bin/kernel.bin -m 512 -hda qemu/TestOs_test.img
