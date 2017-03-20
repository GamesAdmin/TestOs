#! /bin/sh

#Чистка собранных файлов - 
#Удаление объектных файлов, бинарных файлов, ISO-образов
rm -rf obj/*
rm -rf bin/*
rm -rf disk/boot/*.bin
rm -rf image/*