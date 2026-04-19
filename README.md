# Docker LAMP - PHP 8.4 & MySQL 8.0

Entorno de desarrollo basado en Docker con Apache, MySQL 8.0, PHPMyAdmin y PHP 8.4 (con Node.js 20 y Composer).

## 🚀 Instalación y Ejecución

Para levantar los contenedores por primera vez o aplicar cambios en el Dockerfile:

```bash
docker compose up -d --build

🔗 Accesos

    Aplicación Web: http://localhost:9084

    phpMyAdmin: http://localhost:9085

    Base de Datos (MySQL):

        Host: localhost

        Puerto: 3308
        Usuario: laravel

        Password: secret

        Base de Datos: laravel_gsm

📂 Estructura del Proyecto

Clona tu proyecto Laravel dentro del directorio www/. Para acceder a la carpeta pública de Laravel:

    http://localhost:9084/TuProyecto/public

🛠 Comandos Útiles
Gestión de Contenedores

    Detener servicios: docker compose down

    Ver logs: docker compose logs -f

    Entrar al terminal de PHP:
    Bash

    docker exec -it php_app_84 bash

Acceso Directo a MySQL
Bash

docker exec -it mysql_db_84 mysql -u root -p

Limpieza Total (Reset)

Si necesitas borrar todos los contenedores e imágenes para empezar de cero:
Bash

# Detener y eliminar contenedores/volúmenes del proyecto
docker compose down -v

# Limpieza profunda (Cuidado: elimina todo lo que no esté en uso)
docker rm -vf $(docker ps -a -q)
docker rmi -f $(docker images -a -q)

🎥 Video Tutorial y Referencias

Watch the video 👇

Puedes leer más detalles en este artículo: Apache, PHP, MySQL y PHPMyAdmin con Docker LAMP.

Infrastructure as code!

