#!/bin/bash

# Script para activar o desactivar la VPN de CNEA
# Se debe cambiar el UUID dependiendo de la máquina
# 

VPN_CNEA_NAME="CNEA"

if [ $# ==  0 ]
  then
    echo 'Falta introducir argumento [up] o [down]'
elif [ $1 == 'up' ] 
  then
      nmcli con up id ${VPN_CNEA_NAME}
elif [ $1 == 'down' ] 
  then
      nmcli con down id ${VPN_CNEA_NAME}
 else
   echo 'Argumento no reconocido. Las opciones son [up] o [down]'
fi
