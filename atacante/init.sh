#!/bin/sh
# Espera hasta que la red esté disponible
sleep 2

# Eliminar la ruta predeterminada existente
ip route del default

# Agregar la nueva puerta de enlace predeterminada
ip route add default via 172.21.0.2

# Empezar el nginx 
service nginx start

# Mantener el contenedor en ejecución
tail -f /dev/null
