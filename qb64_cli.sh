#/bin/bash

# Script para compilar programas el qbasic usando qb64
# Ejemplo:
#         qb64_cli.sh NAME.BAS
#         qb64_cli.sh -c NAME.BAS
#         qb64_cli.sh -x NAME.BAS
# En todos los casos se generaa el ejecutable NAME en la misma 
# carpeta donde está NAME.BAS
#

if [ $# -eq 0 ]
then
    echo "Faltan argumentos (-[c,x] name.bas)"
    exit 1
elif [ -z $2 ]
then
    FILE=`realpath -e $1`
    ARGUM="-x ${FILE}"
elif [ -z $3 ]
then
    FILE=`realpath -e $2`
    ARGUM="$1 ${FILE}"
else
    echo "Demasiados argumentos"
    exit 1
fi

QB64_PATH=$(whereis qb64 | awk '{print $2}' )

${QB64_PATH} ${ARGUM} -o ${FILE%.*}


