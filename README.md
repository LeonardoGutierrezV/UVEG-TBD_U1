# UVEG-TBD_U1
## UVEG TBD_U1_Reto1_SGBDAnálisis

Se adjunta archivo de configuración inicial **docker-compose.yml**
Para la creación de un contenedor **Docker** con **MySQL** para la realización de laboratorios de bases d edatos.

Para la creación del contenedor se sugiere lo siguiente.

Clonar el repositorio

``
git clone https://github.com/LeonardoGutierrezV/UVEG-TBD_U1
``

Acceder a la ubicación del repositorio

``
cd UVEG-TBD_U1
``

Crear el contenedor

`` 
docker-compose u
``

La IP para acceder al servicio dentro del contenedor regularmente es: 172.29.48.1
O se encuentra dentro del segmento 172.29.48.*, en caso de no poder acceder con esta IP puede ejecutar la consulta.

`` ps
arp -a 
``

Y ubicar la IP dentro del segmento indicado

