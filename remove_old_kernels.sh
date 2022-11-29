#!/bin/bash

for i in $(dpkg -l | grep 5.15.0-48 | awk '{print $2}') ; do
    echo "Borrando $i"
    sudo dpkg --purge $i
done

