FROM kalilinux/kali-rolling

RUN apt update && apt install -y bettercap iproute2 net-tools iputils-arping iputils-ping nginx

EXPOSE 80

COPY ./index.html /var/www/html/index.nginx-debian.html

# Copiar el script de inicio
COPY ./init.sh /init.sh
RUN chmod +x /init.sh

# Usar el script de inicio como comando
CMD /init.sh
