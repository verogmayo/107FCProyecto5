# 107FCProyecto5 - 05-Guía Docker Compose WordPress
Las capturas entán en el pdf que está en la carpeta del proyecto

## 1. ¿Cómo puedes iniciar los servicios definidos en este archivo docker-compose.yml?

- Para iniciar los servicios de docker-compose se utiliza el comando:

```bash
docker-compose up -d
```
*-d, se utiliza para que se inicie en segundo plano y poder seguir utilizando la consola.*

- Se mira si están los volúmenes :
```bash
docker volume ls
```

## 2. ¿Qué pasa si cambias las credenciales en el archivo .env después de haber creado los contenedores? ¿Se reflejan automáticamente?

No, si se cambian las credenciales en el archivo .env no se reflejan automáticamente.
  En este caso se han cambiado el usuario y la contraseña.

-Hay que apagar el contenedor con:

```bash
docker-compose down -v
```
*-v es para para todos los volumenes*




- Se mira si los volumnes se han borrado.

```bash
docker volume ls
```

- Y se vuelve a iniciar para que tome en cuenta los cambios:

```bash
docker-compose up -d
```
**Nota:** Deja entrar a phpMyAdmin solo desde una página oculta. Y hay que recrear la cuenta en WP ya que es otro usuario.


## 3. ¿Cómo puedes verificar si los volúmenes wordpress_data y mysql_data están siendo utilizados correctamente?

- Para verificar si los volúmenes están siendo utilizados correctamente. Se listan los volúmenes:
```bash
docker volume ls
```

- Se inspeccionan los volúmenes:
```bash
docker volume inspect 05-wordpress_wordpress_data
```

```bash
docker volume inspect 05-wordpress_mysql_data
```
*SE puede ver la información relativa a los volúmenes*


## 4. ¿Cómo puedes acceder a la base de datos de WordPress usando phpMyAdmin, y qué credenciales deberías usar?
- Estas son las credenciales para acceder a la base de datos
Accede a http://localhost:8080

En phpMyAdmin, usa:
- **Servidor:** mysql
- **Usuario:** wp_user
- **Contraseña:** wp_password
- 

## 5. ¿Qué comando puedes usar para ver los logs de WordPress y detectar errores durante el arranque?

Se puede usar para ver los logs de WordPress:
```bash
docker-compose logs wordpress
```


## 6. ¿Cómo puedes comprobar si el contenedor de MySQL está corriendo correctamente y escuchando en el puerto 3306?

- Se comprueba si el contenedor está activo.
```bash
docker ps
```
*Se puede ver que MySQL está en el puerto 3306.*



## 7. ¿Qué debes hacer si deseas exponer el sitio WordPress en otro puerto, por ejemplo, el 8081?

- Para exponer el sitio WordPress en otro puerto hay que modificar el puerto del WordPress en el fichero docker-compose.yml:

```yaml
wordpress:
  image: wordpress
  ports:
    - 8081:80
  environment:
    - WORDPRESS_DB_HOST=mysql
    - WORDPRESS_DB_NAME=${WORDPRESS_DB_NAME}
    - WORDPRESS_DB_USER=${WORDPRESS_DB_USER}
    - WORDPRESS_DB_PASSWORD=${WORDPRESS_DB_PASSWORD}
  volumes:
    - wordpress_data:/var/www/html
  depends_on:
    - mysql
  restart: always
```

- Y se para y se vuelve a iniciar el contenedor.

```bash
docker-compose down
```

```bash
docker-compose up -d
```

## 8. Funcionamiento de phpMyAdmin

- ver pdf


## 9. Instalación de WordPress: ver el sitio web

- ver pdf


## 10. Ver la administración

- ver pdf
