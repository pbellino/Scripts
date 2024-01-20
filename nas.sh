#!/bin/bash

MOUNT="/media/pablo/nas"

if [ $# ==  0 ]
  then
    echo 'Falta introducir argumento [montar] o [desmontar]'
elif [ $1 == 'desmontar' ] 
  then
    fusermount -u ${MOUNT}
elif [ $1 == 'montar' ] 
  then
    sshfs -o reconnect -o workaround=rename pablo_adm@192.168.0.20:/share ${MOUNT}
 else
   echo 'Argumento no reconocido. Las opciones son [montar] o [desmontar]'
fi
