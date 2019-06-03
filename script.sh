### Codigo del laboratorio 1###  
sed 's#/#-#g' data.csv > out1   
## esto sirve para cambiar el / por -
sed 's#\([0-9][0-9]\)-\([0-9][0-9]\)-\([0-9][0-9]\)#20\3-\2-\1#' out1 > out2
## esto sirve para cambiar de orden las fechas los /( sirve para almacenar en la memoria algo que quiero que luego la pueda utilizar en este caso fue para re ordenar
sed 's#\([0-9]\)-\([0-9]\)-\([0-9][0-9][0-9][0-9]\)#\3-0\2-0\1#' out2 > out3
## sirve para arreglar ultima fila y ordenarla de acuerdoa lo requerido
sed 's#;;#;\\N;#g' out3 > out4
## esto se hace para cambiar el espacio vacio por un \N 
sed 's#;N#;\\N#g' out4 > out5
## esto se hace para cambiar todas las N por \N
sed 's#;\\n#;\\N#g' out5 > out6
## este sirve para cambiar las \n por \N
sed 's#;n#;\\N#g' out6 > out7
## esta sirve para cambiar las n por \N
sed 's#;\r#;\\N\r#g' out7 > out8
## este sirve para pornerle \N al final de la linea esto se hace gracias al $
sed 's#;#,#g' out8 > out9
## este sirve para cambiar el ; por ,
sed 's#\([0-9][0-9][0-9]\),#\1\.#g' out9 > out10
## este sirve para cambiar las , de los decimales por .
sed 's#B,2,200.0#B,2,200,0#g' out10 > out11
## este sirve para arreglar el tema de del 200.0 al 200,0
sed 's/.*/\U&/' out11 >out12
## este para cambiar las minusculas por mayusculas
sed 's#2013-08-02#2014-08-02#g' out12 > Final.csv
## este sirve para arreglar el problema 
##sed 's/\r//g' out13 > Final.csv
cat Final.csv
