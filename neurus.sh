#!/bin/bash

# Script para montar la partición de neurus en una máquina local
# Se fija si tiene activa la VPN, de lo contrario la activa
# Esto último se debe modificar dependiendo la situacion

VPN_CNEA="CNEA"
VPN_ACTIVA=$(nmcli -t -f NAME c show --active)

if [ $# ==  0 ]
  then
    echo 'Falta introducir argumento [montar] o [desmontar]'
elif [ $1 == 'desmontar' ] 
  then
    fusermount -u /media/pablo/neurus/
    fusermount -u /media/pablo/gripra3/
    fusermount -u /media/pablo/grcn/
    # Pregunta si se desactiva la VPN
    read -p "¿Desconecto la VPN? [y/n] " answ
    if [ ${answ} == 'y' ]; then
        vpn_cnea.sh down
    else
        echo "No se modificó la VPN al desmontar" 
    fi
elif [ $1 == 'montar' ] 
  then
      # Si no está activa la VPN, la activa
      if [ "${VPN_ACTIVA}" != "${VPN_CNEA}" ];
      then
          vpn_cnea.sh up
      fi
    sshfs -o reconnect -o workaround=rename pbellino@neurus:/home/pbellino /media/pablo/neurus
    sshfs -o reconnect -o workaround=rename pbellino@neurus:/share/gripra3/pbellino/ /media/pablo/gripra3
    sshfs -o reconnect -o workaround=rename pbellino@neurus:/share/grcn/pbellino/ /media/pablo/grcn
 else
   echo 'Argumento no reconocido. Las opciones son [montar] o [desmontar]'
fi
