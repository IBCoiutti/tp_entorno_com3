FROM ubuntu:22.04
LABEL manteiner="Coiutti, Pilafis, Ferrarese"

RUN apt-get update && apt-get install -y wget
RUN apt install imagemagick
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

WORKDIR /
COPY . .
RUN chmod +x /menu.sh
RUN chmod +x /generar.sh
RUN chmod +x /procesar.sh
RUN chmod +x /comprimir.sh
RUN chmod +x /descomprimir.sh
CMD ["bash", "/menu.sh"]
