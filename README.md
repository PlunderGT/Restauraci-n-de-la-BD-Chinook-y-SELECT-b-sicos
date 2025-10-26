# Restauración de la BD Chinook y SELECT básicos

## Descripción del Proyecto
Este proyecto documenta el proceso de restauración de la base de datos Chinook en PostgreSQL y la realización de consultas SELECT básicas para explorar los datos.

## Requisitos Previos
- Docker instalado
- PostgreSQL (vía Docker)
- Base de datos Chinook

## 1. Restauración de la Base de Datos Chinook

### Pasos para restaurar la BD en Docker:

```bash
# 1. Descargar la imagen de PostgreSQL
docker pull postgres

# 2. Crear y ejecutar el contenedor
docker run --name postgres-chinook -e POSTGRES_PASSWORD=mysecretpassword -p 5432:5432 -d postgres

# 3. Copiar el archivo de backup al contenedor
docker cp Chinook_PostgreSql.sql postgres-chinook:/Chinook_PostgreSql.sql

# 4. Restaurar la base de datos
docker exec -it postgres-chinook psql -U postgres -f /Chinook_PostgreSql.sql
```

## 2. Consultas SELECT Realizadas

### Consulta 1: Seleccionar todas las columnas de una tabla

**Descripción:** Obtiene todos los datos de la tabla `artist`.

```sql
SELECT * FROM artist;
```

**Resultado esperado:**
- Muestra todos los artistas con sus IDs y nombres
- Columnas: artist_id, name

---

### Consulta 2: Seleccionar solo algunas columnas de una tabla

**Descripción:** Obtiene únicamente el nombre y correo electrónico de los clientes.

```sql
SELECT first_name, last_name, email FROM customer;
```

**Resultado esperado:**
- Lista de clientes con información de contacto básica
- Columnas: first_name, last_name, email

---

### Consulta 3: Seleccionar registros de diferentes tablas sin filtros

**Descripción:** Muestra información de álbumes y sus artistas usando un JOIN.

```sql
SELECT album.title AS album_title, artist.name AS artist_name
FROM album
JOIN artist ON album.artist_id = artist.artist_id;
```

**Resultado esperado:**
- Lista de álbumes con el nombre de su artista correspondiente
- Columnas: album_title, artist_name

---

### Consulta 4: Usar LIMIT para mostrar solo algunos resultados

**Descripción:** Obtiene los primeros 5 tracks de la base de datos.

```sql
SELECT * FROM track LIMIT 5;
```

**Resultado esperado:**
- Primeros 5 tracks con toda su información
- Columnas: track_id, name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price

---

### Consulta 5: Seleccionar todas las filas de una tabla utilizando *

**Descripción:** Obtiene todos los registros de la tabla de géneros musicales.

```sql
SELECT * FROM genre;
```

**Resultado esperado:**
- Lista completa de géneros musicales disponibles
- Columnas: genre_id, name

---

## 3. Estructura de la Base de Datos Chinook

La base de datos Chinook contiene las siguientes tablas principales:

- **Artist**: Información de artistas
- **Album**: Álbumes musicales
- **Track**: Canciones individuales
- **Customer**: Clientes de la tienda
- **Invoice**: Facturas de ventas
- **Genre**: Géneros musicales
- **MediaType**: Tipos de medios
- **Playlist**: Listas de reproducción
- **Employee**: Empleados de la empresa

## 4. Conclusiones

Las consultas SELECT básicas permiten:
- Explorar la estructura de las tablas
- Obtener información específica mediante selección de columnas
- Limitar resultados para mejor visualización
- Relacionar datos entre diferentes tablas
- Comprender la organización de la base de datos Chinook

## Autor
Proyecto desarrollado como práctica de consultas SQL básicas con PostgreSQL.

## Fecha
Octubre 2025
