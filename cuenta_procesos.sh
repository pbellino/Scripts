#!/bin/bash

# Script para contar cuántos procesos 
# se están corriendo en una determinada máquina
# 
# Modo de uso
# -----------
#      cuenta_procesos.sh proceso computadora
# Ejemplo
#--------
# >>> cuenta_procesos.sh lmp_mpi_p compute-0-0
# >>> 64

ssh $2 'bc <<< $(ps -C '$1' | wc -l)-1'
