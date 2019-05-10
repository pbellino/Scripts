#!/bin/bash
#
# Control de corridas de conductividad t√rmica
# en el cluster ISAAC
#
# No necesita entradas
# Hardcodeado el archivo que se quiere leer
#

RUN_CLUSTER=$(qstat | grep bellino | grep R | wc -l)
RUN_FILE=$(grep R /home/bellino/MOX/ThermalConductivity/UPuNpO_Pu30/CONTROL_CORRIDAS.txt | wc -l)

echo "Trabajos corriendo en cluster:" ${RUN_CLUSTER}
echo "Trabajos corriendo en archivo:" ${RUN_FILE}

QUEUE_CLUSTER=$(qstat | grep bellino | grep Q | wc -l)
QUEUE_FILE=$(grep Q /home/bellino/MOX/ThermalConductivity/UPuNpO_Pu30/CONTROL_CORRIDAS.txt | wc -l)

echo "Trabajos encolados en cluster:" ${QUEUE_CLUSTER}
echo "Trabajos encolados en archivo:" ${QUEUE_FILE}
