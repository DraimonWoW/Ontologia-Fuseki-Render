# Imagen base oficial de Fuseki
FROM stain/jena-fuseki:4.8.0

# Directorio de trabajo por convención
WORKDIR /jena-fuseki

# Copiar base de datos y configuraciones
COPY run/databases/Juegos /jena-fuseki/databases/Juegos
COPY dataset/config.ttl    /jena-fuseki/config.ttl
COPY dataset/shiro.ini     /jena-fuseki/shiro.ini

# Exponer el puerto 3030 (usado por Fuseki)
EXPOSE 3030

ENTRYPOINT fuseki-server \
  --port=${PORT:-3030} \
  --host=0.0.0.0 \
  --config=/jena-fuseki/config.ttl