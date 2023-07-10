# tp_entorno_com3
editores: Coiutti Ferrarese Pilafis
## Installation
***
introduccion de instalacion para el funcionamiento.



sudo chmod 666 /var/run/docker.sock
docker build --tag tp_entorno_com3/tp2023:1.0 .
docker run -v $PWD/archivo_comprimido:/archivo_comprimido -it tp_entorno_com3/tp2023:1.0



docker run --cidfile container_id.txt -it tp_entorno_com3/tp2023:1.0


