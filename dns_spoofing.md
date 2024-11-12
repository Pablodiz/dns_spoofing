https://www.imperva.com/learn/application-security/dns-spoofing/

El DNS spoofing es un tipo de ataque en el cual el atacante busca que el usuario que está realizando una consulta DNS reciba una IP diferente a la esperada, consiguiendo de esta forma que se dirija a una web distinta a la esperada. Esto podría llevar a que el usuario introduzca sus credenciales en un formulario malicioso o a que de descargue archivos maliciosos, por ejemplo. 

Hay varios formatos de DNS Spoofing:
- Man In The Middle (MITM): El atacante, posicionándose en el medio de la conexión entre el usuario y el servidore DNS, intercepta sus comunicaciones para modificar la respuesta y redirigir al usuario a una dirección IP distinta.
- Explotar el Time-To-Live (TTL): Este método explota el TTL de las cachés de servidores DNS, con el objetivo de que las entradas DNS maliciosas persistan por más tiempo en las mismas. De esta forma, se puede ampliar el la duración y número de víctimas del ataque. 
- DNS Server Compromise: En este método, se secuestra un servidor DNS configurado para devolver direcciones IP maliciosas. De esta forma, ganan control de todo el proceso de resolución DNS. 


docker network create inter_network

Man In The Middle con bettercap:
```
docker exec -it atacante bettercap -iface eth0
set net.probe on
set arp.spoof.targets 172.20.0.3,172.20.0.1
arp.spoof on 
set dns.spoof.domains example.com
set dns.spoof.address 172.20.0.2
dns.spoof on
```

