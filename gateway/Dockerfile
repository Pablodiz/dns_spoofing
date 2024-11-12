# Usamos una imagen base de Debian
FROM debian:12

# Instalamos las herramientas necesarias
RUN apt-get update && apt-get install -y \
    iproute2 \
    iputils-ping \
    iputils-arping \
    net-tools \
    iptables \
    dnsutils \
    && apt-get clean

# Copiar el script de inicio
COPY ./init.sh /init.sh
RUN chmod +x /init.sh

# Usar el script de inicio como comando
CMD /init.sh
