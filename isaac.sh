#!/bin/bash

if [ $# ==  0 ]
  then
    echo 'Falta introducir argumento [montar] o [desmontar]'
elif [ $1 == 'desmontar' ] 
  then
    fusermount -u /media/pablo/isaac/
elif [ $1 == 'montar' ] 
  then
    sshfs -o reconnect -o workaround=rename bellino@isaac:/home/bellino /media/pablo/isaac
 else
   echo 'Argumento no reconocido. Las opciones son [montar] o [desmontar]'
fi
