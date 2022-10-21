#!/bin/bash

# Bash script que lee un  archivo que contiene una base de personas con sus datos (nombre, apellido, genero, fecha de nacimiento, correo, celular y dirección) y genera un nuevo archivo con el resumen de los nombres y numeros de celular de los archivos leídos.

# El script debe leer solo los archivos del día y el archivo resultante debe llevar la fecha del día en el nombre.

# Entrada: Archivo1_YYYYMMDD.txt
# Resultado: Reporte_YYYYMMDD.txt

# Variables globales
today=`date +"%Y%m%d"`
input_file="Archivo1_$today.txt"
output_file="Reporte_$today.txt"
filter_word_1="Nombre"
filter_word_2="Celular"

# Se lee el archivo del día
while read -r line
do
  echo $line
done < $input_file

# Eliminamos el archivo de salida si existe
if [ -f $output_file ]; then
  rm $output_file
  echo ""
  echo "Archivo eliminado con éxito"
else
  touch Reporte_${today}.txt
  echo "Archivo creado con éxito"
fi

# Filtra por "Nombre" y "Celular" y lo guarda en el archivo de salida
egrep -w "$filter_word_1|$filter_word_2" $input_file >> $output_file
echo ""
echo "Reporte generado con éxito"
