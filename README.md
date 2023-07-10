# tp_entorno_com3
Coiutti_Ferrarese_Pilafis



sudo chmod 666 /var/run/docker.sock
docker build --tag tp_entorno_com3/tp2023:1.0 .
docker run -v /home/franco/tp_entorno_com3/archivo_comprimido:/archivo_comprimido -it tp_entorno_com3/tp2023:1.0



docker run --cidfile container_id.txt -it tp_entorno_com3/tp2023:1.0


