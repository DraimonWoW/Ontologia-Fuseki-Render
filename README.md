# Ontología “Juegos” con Fuseki + Docker

## Contenido
- `run/databases/Juegos/` – tu dataset TDB2.
- `dataset/config.ttl` – config de endpoints de Fuseki.
- `Dockerfile` – definición de la imagen.
- `.dockerignore` – evita copias innecesarias.

## Construir y probar localmente
```bash
docker build -t ontologia-juegos .
docker run -p 3030:3030 ontologia-juegos
