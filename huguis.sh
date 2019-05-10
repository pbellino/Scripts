#!/bin/bash

if [ $# ==  0 ]
  then
    echo 'Falta introducir argumento [montar] o [desmontar]'
elif [ $1 == 'desmontar' ] 
  then
    fusermount -u /media/pablo/huguis/
elif [ $1 == 'montar' ] 
  then
    sshfs -o reconnect -o workaround=rename pablo@huguis:/home/pablo /media/pablo/huguis
fi
