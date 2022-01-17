#!/bin/sh

# Reinicia el servidor del touchpad que deja de funcionar
# luego de una suspensión
#
# Ubicar en /lib/systemd/system-sleep (para Ubuntu 20.04)

case $1 in
 pre)
    ;;
 post)
    modprobe -r psmouse
    modprobe psmouse
    ;;
esac
