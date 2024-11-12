FROM debian:12

RUN apt-get update && apt-get install -y dnsutils lynx net-tools iputils-arping iputils-ping iproute2

# Copiar el script de inicio
COPY ./init.sh /init.sh
RUN chmod +x /init.sh

# Usar el script de inicio como comando
CMD /init.sh