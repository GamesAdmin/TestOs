#! /bin/sh

#Сборка kernel.asm в объектный файл
nasm -f elf32 src/kernel.asm -o obj/kernel_asm.o
#Сборка kernel.cpp в объектный файл
g++ -m32 -c src/kernel.cpp -o obj/kernel_cpp.o -ffreestanding -O2 -Wall -Wextra -fno-exceptions -fno-rtti
#g++ -m32 -c src/kernel.cpp -o obj/kernel_cpp.o
#Линковка объектных файлов со скриптом kernel.ld
ld -m elf_i386 -T src/kernel.ld -o bin/kernel.bin obj/kernel_asm.o obj/kernel_cpp.o
#g++ -m32 -T src/kernel.ld -o bin/kernel.bin -ffreestanding -O2 -nostdlib obj/kernel_asm.o obj/kernel_cpp.o -lgcc

#Копирование бинарных файлов в директорию, на основе которой мы будем создавать ISO-образ
cp bin/kernel.bin disk/boot/
#Создание ISO с booloader - Grub
grub-mkrescue -o image/testos.iso disk/
