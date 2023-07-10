# tp_entorno_com3
Editores: Coiutti Ferrarese Pilafis
Entrega trabajo practico. 
Entorno de programaciòn TUIA 2023 comisiòn 3
## Installation
***
Introduccion de instalacion para el funcionamiento.
Para correr el programa ejecutar los siguientes script en el orden que aparecen

1) sudo apt install docker
2) sudo chmod 666 /var/run/docker.sock
3) docker build --tag tp_entorno_com3/tp2023:1.0 .
4) docker run -v $PWD/archivo_comprimido:/archivo_comprimido -it tp_entorno_com3/tp2023:1.0



docker run --cidfile container_id.txt -it tp_entorno_com3/tp2023:1.0
