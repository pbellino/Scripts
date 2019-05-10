#!/bin/bash

if [ $# ==  0 ]
  then
    echo 'Falta introducir argumento [montar] o [desmontar]'
elif [ $1 == 'desmontar' ] 
  then
    fusermount -u /media/pablo/neurus/
elif [ $1 == 'montar' ] 
  then
    sshfs -o reconnect -o workaround=rename pbellino@login-0-0.dcap.cnea.gov.ar:/home/bellino /media/pablo/neurus
 else
   echo 'Argumento no reconocido. Las opciones son [montar] o [desmontar]'
fi
