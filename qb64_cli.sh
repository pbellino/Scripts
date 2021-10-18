#/bin/bash

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


