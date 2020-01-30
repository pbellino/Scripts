#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
Pide el horario a la página de intranet de CNEA.

    Uso: horario.py [mes] [año]
        horario.py [mes]

    Los parametros [mes] y [año] son opcionales.
    [mes] = 1,2,3,4,5,6,7,8,9,10,11,12
    [año] = 2020, 2019, 2018,2017,2016,2015,2014

    Si no se introduce [mes] y [año] se toman los actuales.
    Si no se introduce [año] se toma el actual.

TODO: Se pueden leer los valores posibles directamente del formulario
"""

import mechanize
import sys


def main():

    url = 'http://apps-intranet.cnea.gob.ar/control-horario/'
    mail = 'pbellino@cnea.gov.ar'

    if len(sys.argv) < 2:
        print('Se toman mes y año de hoy.')
    elif len(sys.argv) == 2:
        print(int(sys.argv[1]))
        if int(sys.argv[1]) in range(1, 13):
            mes = str(int(sys.argv[1]))
            print('Se toma año de hoy')
        else:
            print('Error: no es un mes válido')
            print_help()
            quit()
    elif len(sys.argv) == 3:
        mes = str(int(sys.argv[1]))
        anio = str(int(sys.argv[2]))
        try:
            int(mes), int(anio)
        except ValueError:
            print('Error: el mes y/o año no son válido/s')
            print_help()
            quit()
        if int(mes) not in range(1, 13):
            print('Error: no es un mes valido')
            print_help()
            quit()
        if int(anio) not in range(2014, 2021):
            print('Error: no es un año valido')
            print_help()
            quit()
    elif len(sys.argv) > 3:
        print('Error: se ingresaron muchos argumentos')
        print_help()
        quit()

    br = mechanize.Browser()

    # Sin proxies para dominios locales
    br.set_proxies({})
    br.set_handle_robots(False)

    # Se busca la url
    br.open(url)

    # Se selecciona el formulario
    br.form = list(br.forms())[0]

    # Se completa el formulario
    br['mail'] = mail
    # Se fija si ya fueron asignados el dia y año
    if 'mes' in locals():
        br['mes'] = [mes]
    else:
        mes = br['mes'][0]
    if 'anio' in locals():
        br['anio'] = [anio]
    else:
        anio = br['anio'][0]

    # Se envia el formulario
    response = br.submit()
    # print(response.read())
    br.back()

    print('Horario solicitado para el mes {} de {}'.format(mes, anio))


def print_help():
    print("""
            Uso: horario.py [mes] [año]
                 horario.py [mes]

            Los parametros [mes] y [año] son opcionales.
            [mes] = 1,2,3,4,5,6,7,8,9,10,11,12
            [año] = 2020, 2019, 2018, 2017,2016,2015,2014

            Si no se introduce [mes] y [año] se toman los actuales.
            Si no se introduce [año] se toma el actual.
            """)


if __name__ == "__main__":
    main()
