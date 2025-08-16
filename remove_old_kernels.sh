#!/bin/bash

for i in $(dpkg -l | grep 6.8.0-60 | awk '{print $2}') ; do
    echo "Borrando $i"
    sudo dpkg --purge $i
done

